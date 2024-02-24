import boto3
import sys

ses = boto3.client('ses')

def lambda_handler(event, context):
    ses.send_email(
<<<<<<< HEAD
        Source='georgiaomoja.gmail.com',
=======
        Source='cif-source@yopmail.com',
>>>>>>> 1b7eeef1e4516214a08fc88a0bd32310440d9418
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
