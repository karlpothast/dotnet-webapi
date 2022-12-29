
# generate a self signed cert 
dotnet dev-certs https -ep https/aspnetapp.pfx -p yourpassword

# or place a pfx generated from a CA 
# https://www.namecheap.com/support/knowledgebase/article.aspx/9617/69/how-to-convert-certificates-into-different-formats-using-openssl/
# https://learn.microsoft.com/en-us/mem/configmgr/mdm/deploy-use/create-pfx-certificate-profiles
