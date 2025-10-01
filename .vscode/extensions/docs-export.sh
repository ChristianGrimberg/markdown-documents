#/bin/bash
case $1 in
  "-el_lugar")
		pandoc docs/EL_LUGAR/*.md --metadata-file=config/meta-pdf.yml -o EL_LUGAR.pdf
		echo "Finish export EL LUGAR to PDF"
		pandoc docs/EL_LUGAR/*.md --epub-cover-image=docs/EL_LUGAR/img/portrait-logo.png -o EL_LUGAR.epub -t epub2
		echo "Finish export EL LUGAR to ePub"
		pandoc docs/EL_LUGAR/*.md -o EL_LUGAR.docx
		echo "Finish export EL LUGAR to Word"
	;;
	"-interlocked-doors")
		pandoc docs/interlocked-doors/*.md --metadata-file=config/meta-pdf.yml -o Interlocked-Doors.pdf
		echo "Finish export Interlocked Doors to PDF"
		pandoc docs/interlocked-doors/*.md -o Interlocked-Doors.epub -t epub2
		echo "Finish export Interlocked Doors to ePub"
		pandoc docs/interlocked-doors/*.md -o Interlocked-Doors.docx
		echo "Finish export Interlocked Doors to Word"
	;;
esac