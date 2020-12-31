1. sudo sh pre_deploy.sh > run_pre_deploy.log 2>&1
2. sh download.sh > run_download.log 2>&1
3. sudo sh deploy.sh > run_deploy.log 2>&1
4. cp -f -R zimgChangeCode/zhttpd.* zimg_all_lib/zimg/src/  # already in src
5. cp -f -R zimgConfig zimg_all_lib/zimg/bin/conf           # already in bin/conf
6. cd zimg_all_lib/zimg
7. make
8. set your zimg_all_lib/zimg/bin/conf/zimg.lua

how to start Zimg?
1. cd zimg_all_lib/zimg/bin
2. ./zimg ./conf/zimg.lua