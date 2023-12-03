# lua-uuid

采用 snowflake 算法，生成一个48bit的整数ID, base64 之后可以转化为一个长度为8的字符串 ID
#

1. workerid 6位    // max: 2^6 (0 ~ 63)
2. 时间戳 28位      // max: 2^28-1 (8.512032470827年)
3. 序列号 14位      // max: 2^14-1 (0 ~ 16383)

#
也就是说最多可以支持64个节点, 每秒最多生成 16384 个ID, 系统可以运行最多8.5年 (from epoch)


#
注意:超过最大运行时间(8.5年)后, 如果项目还存在的话, 可以更改算法，进行扩容, 比如在 48bit 前添加一个 6bit 的版本号 并重新设置 epoch, 54bit 对应 base64 长度为9