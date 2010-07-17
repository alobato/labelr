Labelr
======
based on http://github.com/jordanbyron/prawn-labels


	require 'labelr'

	labels = {
		"name\naddress1\naddress2\nzipcode   city - state",
		"name\naddress1\naddress2\nzipcode   city - state"
		"name\naddress1\naddress2\nzipcode   city - state"
		"name\naddress1\naddress2\nzipcode   city - state"
	}

	document = Labelr::Document.new(:pimaco6082)
	document.labels = labels

	document.print


Or use positioned label on page


	label1 = "name\naddress1\naddress2\nzipcode   city - state"
	label2 = "name\naddress1\naddress2\nzipcode   city - state"

	page = Labelr::Page.new(:pimaco6082)

	page.add_label_at_position(3, label)
	page.add_label_at_position(13, label)

	page.print
