<!DOCTYPE html>
<html lang="{function.localeToHTML, defaultLang}">
<head>

	<title>{browserTitle}</title>

	<!-- BEGIN metaTags -->{function.buildMetaTag}<!-- END metaTags -->

	<link rel="stylesheet" type="text/css" href="{relative_path}/stylesheet.css?{config.cache-buster}" />

	<!-- BEGIN linkTags -->{function.buildLinkTag}<!-- END linkTags -->

	<!--[if lt IE 9]>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/es5-shim/2.3.0/es5-shim.min.js"></script>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
  		<script>__lt_ie_9__ = 1;</script>
	<![endif]-->

	<script>
		var RELATIVE_PATH = "{relative_path}";
		var config = JSON.parse('{{configJSON}}');
		var app = {
			template: "{template.name}",
			user: JSON.parse('{{userJSON}}')
		};
	</script>

	<script src="{relative_path}/nodebb.min.js?{config.cache-buster}"></script>

	<!-- IMPORT partials/requirejs-config.tpl -->

	<script>
		$(function(){
			var nav = $('#nav');
			$(window).on('action:ajaxify.end', function(){
				$(window).scroll(function(){
					if ($(this).scrollTop() > 192) {
						nav.addClass('navbar-fixed-top');
					}else{
						nav.removeClass('navbar-fixed-top');
					}
				});
			});
		});
	</script>

	<!-- IF useCustomJS -->
	{{customJS}}
	<!-- ENDIF useCustomJS -->

	<!-- IF useCustomCSS -->
	<style type="text/css">{{customCSS}}</style>
	<!-- ENDIF useCustomCSS -->

</head>

<body class="{bodyClass}">

<div id="flair">
	<span>Something</span>
</div>

<nav id="nav" class="navbar navbar-dark bg-primary">
	<div class="container">

		<a class="navbar-brand" href="#">Navbar</a>

		<ul id="main-nav" class="nav navbar-nav">

			<!-- BEGIN navigation -->
			<!-- IF function.displayMenuItem, @index -->
			<li class="nav-item {navigation.class}">
				<a class="nav-link" href="{relative_path}{navigation.route}" title="{navigation.title}" <!-- IF navigation.id -->id="{navigation.id}"<!-- ENDIF navigation.id --><!-- IF navigation.properties.targetBlank --> target="_blank"<!-- ENDIF navigation.properties.targetBlank -->>

					<!-- IF navigation.iconClass -->
					<i class="fa fa-fw {navigation.iconClass}"></i>
					<!-- ENDIF navigation.iconClass -->

					<!-- IF navigation.text -->
					<span class="{navigation.textClass}">{navigation.text}</span>
					<!-- ENDIF navigation.text -->

				</a>
			</li>
			<!-- ENDIF function.displayMenuItem -->
			<!-- END navigation -->
		</ul>

		<form class="form-inline navbar-form pull-right">
			<input class="form-control" type="text" placeholder="Search">
			<button class="btn btn-success-outline" type="submit">Search</button>
		</form>

	</div>
</nav>

<main id="panel">
	
	<div class="container" id="content">
	<!-- IMPORT partials/noscript/warning.tpl -->