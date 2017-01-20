sshd_custom-config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/files/sshd_config
    - chmod: 644

sshd_service:
  service.running:
    - name: sshd
    - watch:
      - /etc/ssh/sshd_config
