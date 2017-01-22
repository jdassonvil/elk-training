{% set workspace_dir = '/home/elk/workspace' %}
{% set git_repo_url = 'https://github.com/jdassonvil/elk-training.git' %}

workspace_create-dir:
 file.directory:
   - name: {{ workspace_dir }}
   - user: elk
   - group: elk
   - chmod: 755

workspace_install-git:
  pkg.installed:
    - name: git

workspace_clone-repo:
  cmd.run:
    - name: git clone {{ git_repo_url }}
    - cwd: {{ workspace_dir }}
    - runas: elk

workspace_run-cluster:
  cmd.run:
    - name: /usr/local/bin/docker-compose up -d 
    - cwd: {{workspace_dir}}/elk-training
