FROM python:slim
WORKDIR /app

COPY action.py /app
COPY requirements.txt /app
COPY entrypoint.sh /app

RUN ls app/
RUN pip install -r requirements.txt
ENV PYTHONPATH /app
# ENV INPUT_KEY LS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tCk1JSUV2d0lCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQktrd2dnU2xBZ0VBQW9JQkFRRERDM1BGc0ZiUUdXQnkKdjNoWkY0QTVkSHBBSERTT1k2M2ZWUmFlZTBwVWI2SHVZdCtkeWhPZ2dFOFZZODhSUWx5UnpmN2lXT2xwQ3VOQgpzd05LM053ZS9EaC8yZWhzY09yYnVZb1dDYTQvZmxHdGwrZ1oyaS9palV3a2RxS0pKaDlNZ0JvcEFZTTlHSG1tCm1IWjJZZ1ZvSkF0SFFKb0toSXR6dm5LS0RyZVQwbEEvU1h2cjBzZlJ0dUJpMFpoYjRkTzM4REpibWkyUUtGc2IKdmd6eXk2U29nZkx3aE9TLzNCVHFCdXpmemZBZlpGMTRmMmI5MjhOK1J6YnFweFRmOHNpd2p2dnZpSEJ3aElyLwpZdk1JcXB0MjBETVdaSlVvYXZxSlVuTnNVa3AxMklBV0tVdEl3ckR1b05FRU1ZbHJucWpqUVNjVU9hZDU1RDBzCnBBREJyQnliQWdNQkFBRUNnZ0VCQUovQ2xLemIrTy94cVZlMFQrNmgya3kxaEtGWXVRL2N4QUhIMzRRbXRzYWMKdmNYV3hSV28vUlNkcEtsL25JK2xqTTk5TFFiWUR6QVVVL3R2bHdYT0RKdHd1eEsyT2JRQmRjNU9sclhnYmhMaAo5Q005NTBhdHVrVld1WVN3akFmTTZ4d3RYY0F5MWYzSU8zVGpNejFhb3RVZm1RRmZBQTRYYldaOEc3UEx4RURXCk9OWlYzSm5xVWZBb0ZkdldBaHpNYkl1R2t6NkdHNE4xN3hBSzA2eTdpb1FiMGk5ZlBlTlRVR0lrTkVBRUFPbG0Kby8rM0kwYzZkbHc3WWpZRW5zMHJlSWhIVWVFb3E1SEtUWisxQUF6TGFFMExUNnMweWo1bmxidmEwaGFoZkxncApSYWY5M3o5dm1Ba2ZweDBFOExwWUx3L0ZaU1ZRb2F5TkR0c0crbFNORzlrQ2dZRUE1cm1CekVxUk0yUmhTWlhLClVoK1A2eHZhajVyV0xKWWJnTFNLNDV0VW9kTllZbEJIYnFsMTRkRjRIdktpRVExL2E2Z0h2a253djJJR2xwbkwKUTFnZmxIT0FxbU9WcUJsMER6RkNhTmdLWk9ZeXR1bVpnenAzR1lTWEFWaCtSMDRHenUyRlVCdXZzYWw2aGMrTApnMkM0cTVpUk13S0dWdTdTTGhTTE9Ub0NlWFVDZ1lFQTJHbFVneWt1R3JCVDhaZUI3bGh4eHhNd0FrbkQ2Ynd4Ci9hM0xha2I3aE5XN3A0ZTA3a3QyUWdaMC9rRHBpbmprQWdxT2tHbTVlb0oyQkZGcTNPVll6QW40MStkYk5EaGgKdm5EdlQ3MEZPNGxtMHowUlBoQ2F1VGNORnZTbjQ0Qk5NcjBIQzIxVGx2NlNOOGlQbFJJSWVldzN2bXBkZVdnOQpXOWIvUmdoSWE4OENnWUVBcFZMbm51c1BnRE85UW0wQ3ZEWEJla1pMSmZ0YzNEWHpIeFkvTHpodVBFYWtYazRICjRWT3NGRk4wTHpqTXlFdFRzbUNFcStWdmpMTkE1VWp1VFNNbi9jZUZ1cElBK3FMQ2R1QmxKWnNvVjRSYmNwV1EKV21mYVQzNmlkV1JqbDlSaExJVWxzWEVsUTdpZEFxVGs0dzY3UkxuZDBSOU9BNXk5SGllNld4Y21Ec0VDZ1lBawpwYUdVSEhNY1BlUFpNNGpqTGNNR3JTOGlGQS9ERXdWOEtlUWFlUzY2amQ4YlBaWGNESmRZRXZQWTRuRXA2OUxnCnJaejZ3NHlQUEd4enlyM0g3bWFkRnNzMjlJeXpTU0QwT1BldGp4ckZ2RHpYWkszNHpxTUUzbGV2SFhzWXdXOVIKT2tWcEgvaFp4MzVIU0FWWWZ4ZEVYa1lLVHNUSmZHZDNsKzdla3lTQWJRS0JnUUNsWkx5UlNBTzBVaGhNNk4wOAphN1B2eWJ3aXVYK1F2em9QbHdtYlZwd2ZFS3RJNW9rNU9DTjNTbFhlZlgrTHNKcjBIbzZ3aktGL1FpTWh0enh4CnlOZU9xV0Z5U1cyUXJaZ1NzTCs1MU1lNXlWbjRxWHJNZHBZRU5JSTNtTW55emhwZFFuZzg2ajZBbUM0QS9SUmgKZ0lLbC9WanJVQmE0eXovZXN6YzlQSG96Nnc9PQotLS0tLUVORCBQUklWQVRFIEtFWS0tLS0tCg==
# ENV INPUT_ID 123132
RUN chmod u+x app/entrypoint.sh
# CMD ["python", "action.py"]
CMD /app/entrypoint.sh
