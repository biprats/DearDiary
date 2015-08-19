$(document).ready(function() {
	$(".show-more").on("click", function(e) {
		e.preventDefault();
		var page = $(".thoughts").data("page")
		if (page) {
			page = page + 1
		} else {
			page = 1
		}
		$.get(location.pathname, {page: page, format: "json"}, function(data) {
			$(".thoughts").data("page", page)
			console.log(data)
			window.thoughts = data.thoughts
			$(data.thoughts).each(function() {
				var thoughtRow = $(".thoughts tr:first").clone()
				var thoughtLink = thoughtRow.find("td.text a")
				thoughtLink.attr("href", "/authors/" + this.author_id + "/thoughts/" + this.id)
				thoughtLink.text(this.text)
				var authorLink = thoughtRow.find("td.author a")
				authorLink.attr("href", "/author/" + this.author_id)
				authorLink.text(this.author.name)
				var timeLink = thoughtRow.find("span.time")
				timeLink.text(this.time_ago)
				$(".thoughts").append(thoughtRow)
			})
			if (data.end_thoughts) {
				$(".show-more").addClass("hidden")
			}
		});
		return false;
	})
})