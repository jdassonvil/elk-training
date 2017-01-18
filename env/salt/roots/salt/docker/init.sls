docker_install-repo:
  file.managed:
    - name: /etc/yum.repos.d/docker.repo
    - source: salt://docker/files/docker.repo
    - chmod: 644

docker_install-package:
  pkg.installed:
    - name: docker-engine
    - require:
      - docker_install-repo     

docker_install-service:
  service.running:
    - name: docker 
    - enable: True
    - require:
      - docker_install-package
