# web 服务: Nginx + PHP 5.6-fpm + ZendGuardLoader
# 直接复用现成的 PHP/NGINX 运行时快照(见 build/web),
# 保证与 GM 站完全一致,避免重新编译 PHP5.6 的兼容坑。
FROM centos:7

# CentOS 7 已 EOL, 仓库可能失效, 用 || true 避免构建中断(标准库改由下方从 build/web/libs 拷贝)
RUN yum install -y glibc libstdc++ libxml2 libpng libjpeg-turbo freetype \
                   c-ares libicu libbz2 liblzma pcre gzip tar which 2>/dev/null || true \
    && yum clean all 2>/dev/null || true \
    && useradd -M -s /sbin/nologin www 2>/dev/null || true

# 运行时快照
COPY build/web/php/56/        /www/server/php/56/
COPY build/web/nginx/        /www/server/nginx/
COPY build/web/wwwroot_game/ /www/wwwroot/game/

# ZendGuardLoader + php.ini(静态快照,无需 bootstrap)
COPY web/php/ZendGuardLoader.so /usr/local/zend/php56/ZendGuardLoader.so
COPY web/php/php.ini              /www/server/php/56/etc/php.ini
COPY web/nginx/enable-php-56.conf /www/server/nginx/conf/enable-php-56.conf

# PHP5.6 编译时链接的自定义库(绝对路径),原样放回去
COPY build/web/libs/ /
# 原机 /lib64 中 centos:7 镜像缺失的标准库(libpng15/libjpeg/c-ares/icu/freetype)
# 注意: 镜像内 /lib64 是 /usr/lib64 的符号链接, 必须直接 COPY 到 /usr/lib64
COPY build/web/libs64/lib64/ /usr/lib64/
RUN echo '/usr/local/openssl/lib'  > /etc/ld.so.conf.d/zz-cqsj.conf \
    && echo '/usr/local/lib'       >> /etc/ld.so.conf.d/zz-cqsj.conf \
    && echo '/usr/local/curl/lib'  >> /etc/ld.so.conf.d/zz-cqsj.conf \
    && ldconfig

# nginx 配置(覆盖式)
COPY web/nginx.conf                       /www/server/nginx/conf/nginx.conf
COPY web/vhost/1515.conf                 /www/server/panel/vhost/nginx/1515.conf

# OpenResty 的 Lua 模块(resty.core 等), 放到默认搜索路径
COPY build/web/nginx/lib/lua/ /usr/local/share/lua/5.1/
COPY build/web/nginx/lib/lua/ /usr/local/lib/lua/5.1/

COPY web/start.sh /start.sh
RUN chmod +x /start.sh \
    && mkdir -p /tmp /www/server/nginx/logs \
    && chown -R www /tmp /www/wwwroot/game 2>/dev/null || true

EXPOSE 1515 80 88
CMD ["/start.sh"]
