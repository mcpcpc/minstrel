FROM docker.io/python                                        
                                                             
ENV UVICORN_HOST 0.0.0.0                                     
ENV UVICORN_PORT 8080                                          
                                                             
RUN pip3 install minstrel[prod]                              
                                                             
EXPOSE 8080                                                    
                                                             
CMD [ -f ../var/minstrel-instance/minstrel.sqlite ] || quart --app minstrel init-db ; uvicorn --factory minstrel:create_app
