<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AJAX with Servlets using AngularJS</title>
<!-- Bootstrap CSS served from a CDN -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="js/angular.min.js"></script>
<script>
	var app = angular.module('myApp', []);

	function MyController($scope, $http) {

		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'javaAngularJS'
			}).success(function(data, status, headers, config) {
				$scope.config = data;

			}).error(function(data, status, headers, config) {
				// called asynchronously if an error occurs
				// or server returns response with an error status.
			});

		};
	};
</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>AngularJS to Java</h1>
			<p>AuglarJS interface with Bootstrap to access YAML based
				Configuration Manager in Java</p>
		</div>
		<div data-ng-app="myApp">
			<div data-ng-controller="MyController">
				<button type="button" class="btn btn-success btn-lg"
					data-ng-click="getDataFromServer()">Fetch configuration from server</button>

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th>Value</th>
							<th>Others</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Released</td>
							<td>{{config.released}}</td>
							<td></td>
						</tr>
						<tr>
							<td>Version Name</td>
							<td>{{config.version}}</td>
							<td></td>
						</tr>
						<tr>
							<td>URL</td>
							<td>{{config.connection.url}}</td>
							<td></td>
						</tr>
						<tr>
							<td>DB Pool Size</td>
							<td>{{config.connection.poolSize}}</td>
							<td></td>
						</tr>
						<tr>
							<td>Protocols</td>
							<td><ul>
									<li data-ng-repeat="protocol in config.protocols">{{protocol}}
									</li>
								</ul></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<p>
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#demo">User List</button>
				<div id="demo" class="collapse">
					<table id="searchTextResults" class="table table-hover">
						<tr>
							<th>Name</th>
							<th>Password</th>
						</tr>
						<tr data-ng-repeat="(key,value) in config.users">
							<td>{{key}}</td>
							<td>{{ value }}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
</body>
</html>