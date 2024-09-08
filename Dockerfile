FROM rust as builder 
WORKDIR /build
RUN apt-get update && \
    apt-get install clang cmake build-essential pkg-config libssl-dev -y
COPY . .
RUN cargo build --release

FROM debian:12
WORKDIR /root
COPY --from=builder /build/target/release /root/release
ENTRYPOINT [ "/root/release/zgs_node" ]
