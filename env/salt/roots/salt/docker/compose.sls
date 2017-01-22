{% set os = salt['grains.get']('kernel') %}
{% set arch = salt['grains.get']('osarch') %}
{% set compose_version = '1.9.0' %}
{% set compose_hash = 'eeca988428d29534fecdff2768fa2e8c293b812b1c77da8ab5daf7f441c92e5b' %}

compose_install:
  file.managed:
    - name: /usr/local/bin/docker-compose
    - source: https://github.com/docker/compose/releases/download/{{ compose_version }}/docker-compose-{{ os }}-{{ arch }}
    - source_hash: {{ compose_hash }}
    - mode: 755
