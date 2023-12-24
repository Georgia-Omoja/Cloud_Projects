import boto3
import sys

ses = boto3.client('ses')

def lambda_handler(event, context):
    ses.send_email(
        Source='cif-source@yopmail.com',
        Destination={
            'ToAddresses': [
                event['destinationEmail'],
            ]
        },
        Message={
            'Subject': {
                'Data': 'Cloud_Projects - Project 2'
            },
            'Body': {
                'Text': {
                    'Data': event['message']
                }
            }
        }
    )
    return 'Email sent!' 
