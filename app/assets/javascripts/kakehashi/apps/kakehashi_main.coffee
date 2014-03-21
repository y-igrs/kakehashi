App.module 'KAKEHASHI', (KAKEHASHI, App, Backbone, Marionette, $, _) ->

	# Router
	KAKEHASHI.Router = Marionette.AppRouter.extend
		appRoutes:
			"*target": "showTarget"

	# Controller
	KAKEHASHI.Controller = ->
		@trendList = "trendList"
		@

	# extend Controller
	_.extend KAKEHASHI.Controller.prototype,
		start: ->
			console.log "start"
			@showHeader @trendList
			@showFooter @trendList
			@showMain @trendList
			# @trendList.fetch()

		showHeader: (trendList) ->
			header = new App.Layout.Header
			collection: trendList

			App.header.show header

		showFooter: (trendList) ->
			footer = new App.Layout.Footer
			collection: trendList

			App.footer.show footer

		showMain: (trendList) ->
			# App.main.show new KAKEHASHI.Views.ListView
			# 	collection: todoList

		showTarget: (target) ->
			console.log "ここで対処のアイテムを絞り込む？"
			console.log target

	# Initialize
	KAKEHASHI.addInitializer ->
		controller = new KAKEHASHI.Controller()
		controller.router = new KAKEHASHI.Router
			controller: controller
		controller.start()
