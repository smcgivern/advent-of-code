const std = @import("std");

// Command-line flags:
// - part1 - output part 1 answer
// - part2 - output part 2 answer
// - jumps - print all possible jumps to stdout
// - explain - run and print out operations to stderr

// TODO: make an enum (see tagName)
const ops = .{ "acc", "jmp", "nop" };

fn parseOp(candidate: []const u8) i16 {
    inline for (ops) |op, i| {
        if (std.mem.eql(u8, candidate, op)) {
            return @intCast(i16, i);
        }
    }

    return -1;
}

// TODO just use std.os.argv!
fn argv(i: u8) []u8 {
    var args = std.process.args();
    var j: u8 = 0;

    while (j <= i) : (j += 1) {
        _ = args.skip();
    }

    return (args.next(std.heap.page_allocator) orelse "") catch "";
}

pub fn load(operations: *[65536]i16, arguments: *[65536]i16, stderr: anytype) !void {
    const source = try std.fs.cwd().openFile("08.dat", .{});
    defer source.close();

    const source_size = try source.getEndPos();
    var raw: [131072]u8 = undefined;
    _ = try source.read(raw[0..source_size]);

    var lines = std.mem.tokenize(&raw, "\n");
    var line: usize = 0;

    while (lines.next()) |token| {
        if (lines.index > source_size) {
            break;
        }

        var segments = std.mem.tokenize(token, " ");
        const operation = segments.next() orelse "";

        operations[line] = parseOp(operation);
        arguments[line] = try std.fmt.parseInt(i16, segments.next() orelse "0", 10);
        line += 1;

        if (operations[lines.index] == -1) {
            try stderr.print("unhandled operation: {}\n", .{operation});
            break;
        }
    }
}

pub fn main() !void {
    var i: usize = 0;
    var opcode: i16 = 0;
    var argument: i16 = 0;
    var acc: i64 = 0;
    var operations: [65536]i16 = undefined;
    var arguments: [65536]i16 = undefined;
    var visited = [_]i16{0} ** 65536;

    const stdout = std.io.getStdOut().outStream();
    const stderr = std.io.getStdErr().outStream();
    const arg0 = argv(0);

    try load(&operations, &arguments, stderr);

    if (std.mem.eql(u8, "jumps", arg0)) {
        for (operations) |operation, j| {
            argument = arguments[j];

            if (operation > 0) {
                try stdout.print("{}: {} {}: {}\n", .{ j, operation, argument, @intCast(usize, @intCast(i16, j) + argument) });
            }
        }

        return;
    }

    while (true) {
        opcode = operations[i];
        argument = arguments[i];

        if (std.mem.eql(u8, "part1", arg0)) {
            if (visited[i] == 1) {
                try stdout.print("looping! {} {}\n", .{ i, acc });
                break;
            } else {
                visited[i] = 1;
            }
        } else if (std.mem.eql(u8, "part2", arg0)) {
            if (i == 432) {
                opcode = 2;
            }
        } else if (std.mem.eql(u8, "explain", arg0)) {
            if (opcode > 0) {
                try stderr.print("{}: {} {} {}: {}\n", .{ i, opcode, argument, acc, @intCast(i16, i) + argument });
            }
        }

        switch (opcode) {
            // acc
            0 => {
                acc += argument;
                i += 1;
            },
            // jmp
            1 => {
                i = @intCast(usize, @intCast(i16, i) + argument);
            },
            // nop
            2 => {
                i += 1;
            },
            else => {
                try stdout.print("terminated! {}\n", .{acc});
                break;
            },
        }
    }
}
