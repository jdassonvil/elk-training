elk_group:
  group.present:
    - name: elk
    - system: True

elk_user:
  user.present:
    - name: elk
    - password: $1$cu1w3WIt$NauHKOo8V1LWmeChlqfL2/
    - groups:
      - elk
      - docker
    - require:
      - elk_group
