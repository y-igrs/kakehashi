App.module 'KAKEHASHI', (KAKEHASHI, App, Backbone, Marionette, $, _) ->

	# Router
	KAKEHASHI.Router = Marionette.AppRouter.extend
		appRoutes:
			"*target": "showTarget"

	# Controller
	KAKEHASHI.Controller = ->
		@trendList = new App.Trends.TrendList()
		@

	# extend Controller
	_.extend KAKEHASHI.Controller.prototype,
		start: ->
			# console.log "show header"
			@showHeader @trendList
			# console.log "show footer"
			@showFooter @trendList
			# console.log "show list"
			@showMain @trendList
			# console.log "show fetch"
			@trendList.fetch()
			# console.log "done"

		showHeader: (trendList) ->
			header = new App.Layout.Header
				collection: trendList

			App.header.show header

		showFooter: (trendList) ->
			footer = new App.Layout.Footer
				collection: trendList

			App.footer.show footer

		showMain: (trendList) ->
			App.main.show new KAKEHASHI.Views.ListView
				collection: trendList

		showTarget: (target) ->
			# console.log "target parametter:" + target


	# Initialize
	KAKEHASHI.addInitializer ->
		controller = new KAKEHASHI.Controller()
		controller.router = new KAKEHASHI.Router
			controller: controller
		controller.start()