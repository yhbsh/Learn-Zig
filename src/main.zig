const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    const x = 4;
    var t: [x]std.Thread = undefined;
    _ = t;

    var biglist = std.ArrayList(u8).init(std.heap.page_allocator);
    defer biglist.deinit();

    var i: u32 = 0;
    while (i < x) : (i += 1) {}

    for (1..1000001) |index| {
        if (i % 10 == 7 or i % 7 == 0) {
            try biglist.writer().print("{s}\n", .{"SMAC"});
        } else {
            try biglist.writer().print("{d}\n", .{index});
        }
    }

    try print_list(&biglist);
}

fn print_list(list: *std.ArrayList(u8)) !void {
    var iter = std.mem.split(u8, list.items, "\n");
    while (iter.next()) |item| {
        try stdout.print("{s}\n", .{item});
    }
}
