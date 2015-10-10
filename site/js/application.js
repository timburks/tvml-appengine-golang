var options;

App.onLaunch = function(_options) {
	options = _options;
	pushDocument("index");
}

function pushDocument(pageName) {
	fetchPage(pageName, function(document) {
		navigationDocument.pushDocument(document);
	});
}

function presentModal(pageName) {
	fetchPage(pageName, function(document) {
		navigationDocument.presentModal(document);
	});
}

function dismissModal() {
	navigationDocument.dismissModal()
}

function fetchPage(pageName, completion) {
	function documentEventListener(event) {
		var handlerName = "on" + event.type.charAt(0).toUpperCase() + event.type.slice(1);
		var handler = event.target.getAttribute(handlerName)
		if (handler) {
			eval(handler)
		}
	}
	var request = new XMLHttpRequest();
	request.responseType = "document";
	request.addEventListener("load", function() {
		document = request.responseXML;
		var events = ["select", "play", "highlight", "holdselect", "change"];
		for (var i in events) {
			document.addEventListener(events[i], documentEventListener, false);
		}
		completion(document);
	}, false);
	request.open("GET", options.BaseURL + "/tv/" + pageName, true);
	request.send();
	return request;
}
