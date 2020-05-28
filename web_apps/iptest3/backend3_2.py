#/usr/bin/python3

import falcon

class HTTP:
    def on_get(self, req, rest):
        print(req.headers)
        rest.status = falcon.HTTP_200
        rest.body = "This is an example backend-3 using python falcon on nginx (algorithm Sticky Sessions)"

# Listen port 8033
apps = falcon.API()
apps.add_route("/", HTTP())
