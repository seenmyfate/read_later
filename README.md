# Read Later

## A demo app

This application exposes a single API endpoint at the root, which expects a GET request with a url as the a single CGI escaped parameter:
	
		curl http://demo-app/read_later\?url\=http://nwrug.org
		
The API endpoint inserts the values into a database asynchronously, and returns a 200 response.  The only errors that will be reported are for missing parameters, the API does not wait or check for a response from the database.
		
### Local setup

Create the databases `read_later` and `read_later_test`, and add an `articles` table

	CREATE TABLE `articles` (
	  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  `url` varchar(255) DEFAULT NULL,
	  PRIMARY KEY (`id`),
	  KEY `time` (`created_at`)
	) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
	
Bundle and then start Goliath
	
	bundle exec ruby read_later.rb -sv
	
You can hit the API using curl

	curl http://0.0.0.0/read_later/\?url\=\/testing
	=> "OK"

Or check the concurrency using ab

	ab -c60 -n200 http://0.0.0.0/read_later/\?url\=\/testing
	
You must include the url
	
	curl http://0.0.0.0:9000/
	=> {"error":"Url identifier missing"}
	
