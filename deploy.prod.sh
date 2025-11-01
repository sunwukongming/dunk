pnpm run build
tar -cjvf dist.tar.bz2 dist
scp dist.tar.bz2 ubuntu@54.226.224.78:/tmp
ssh ubuntu@54.226.224.78 'cd /tmp && tar xvf dist.tar.bz2'
