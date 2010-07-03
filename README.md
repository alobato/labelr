Labelr
======

	require 'label'
	require 'page'
	require 'document'

	label1 = Label.new(2, "João", "Rua A", "Centro", "22221222", "Rio de Janeiro", "RJ")
	label2 = Label.new(1, "João", "Rua A", "Centro", "22221222", "Rio de Janeiro", "RJ")

	page = Page.new
	page.add_label(label1)
	page.add_label(label2)

	document = Document.new
	document.add_page(page)
	document.add_page(page)
	document.add_page(page)
	document.add_page(page)
	document.add_page(page)
	document.add_page(page)
	document.print