# 指定镜像， 声明别名
FROM swift:latest as builder

# 指定工作目录
WORKDIR /root

# 复制当前文件，到上下文文件
COPY . .

# 构建二进制
RUN swift build -c release

# product image
FROM swift:slim

# 指定工作目录
WORKDIR /root

# 复制文件
COPY --from=builder /root .

# 运行命令
CMD [".build/x86_64-unknown-linux/release/Hello"]