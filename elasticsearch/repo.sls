{% from "elasticsearch/settings.sls" import elasticsearch with context %}

{%- if elasticsearch.major_version >= 5 and grains['os_family'] == 'Debian' %}
apt-transport-https:
  pkg.installed
{%- endif %}

elasticsearch_repo:
  pkgrepo.managed:
    - humanname: Elasticsearch {{ elasticsearch.major_version }}
    - name: deb https://artifacts.elastic.co/packages/7.x/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/elastic-7.x.list
#    - keyid: D88E42B4
 #   - keyserver: keyserver.ubuntu.com
    - clean_file: true
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
