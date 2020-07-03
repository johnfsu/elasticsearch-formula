#{% from "elasticsearch/map.jinja" import elasticsearch_map with context %}
#{% from "elasticsearch/settings.sls" import elasticsearch with context %}

#{% if elasticsearch_map.use_repo %}
include:
  - elasticsearch.repo
#{% endif %}

elasticsearch_pkg:
  pkg.installed:
    - name: elasticsearch
 #   {% if elasticsearch.version %}
    - version: 7.5
 #   {% endif %}
 #   {% if elasticsearch_map.use_repo %}
    - require:
      - sls: elasticsearch.repo
  #  {% endif %}
