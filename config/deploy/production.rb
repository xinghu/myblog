set :stage, :production
set :branch, :master
set :rails_env, :development

# 网站服务器
role :web, %w(blog-web)

# 在数据服务器上运行迁移
role :db,  'blog-web', primary: true

# after 'deploy:finished', 'newrelic:notice_deployment'
