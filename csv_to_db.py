import pandas as pd
from sqlalchemy import create_engine
import json

with open('creds.json') as f:
    creds = json.load(f)

user = creds['user']
password = creds['password']
host = creds['host']
port = creds['port']

def setup_db(platform):

    df = pd.read_csv(f'{platform}.csv')
    try:
        df['date_start'] = pd.to_datetime(df['date_start'])
    except:
        df['day'] = pd.to_datetime(df['day'])

    e = create_engine(f'mysql+pymysql://{user}:{password}@{host}:{port}/advertise_data', echo = False)
    df.to_sql(platform,e)

setup_db('facebook')
setup_db('google')

