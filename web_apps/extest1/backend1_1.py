#/usr/bin/python3

import falcon

class HTTP:
    def on_get(self, req, rest):
        print(req.headers)
        rest.status = falcon.HTTP_200
        rest.body = "This is an example backend-1 using python falcon on Nginx. (algorithm Least Connections)"

# Listen port 8021
apps = falcon.API()
apps.add_route("/", HTTP())
