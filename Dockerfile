FROM apache/superset:2.1.0
# Switching to root to install the required packages
USER root
# Example: installing the MySQL driver to connect to the metadata database
# if you prefer Postgres, you may want to use `psycopg2-binary` instead
# RUN pip install psycopg2-binary
# Example: installing a driver to connect to Redshift
# Find which driver you need based on the analytics database
# you want to connect to here:
# https://superset.apache.org/installation.html#database-dependencies
RUN pip install sqlalchemy-redshift
RUN pip install snowflake-sqlalchemy
COPY superset_config.py /app/superset_config.py
# Switching back to using the `superset` user
USER superset