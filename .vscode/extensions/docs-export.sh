#/bin/bash
case $1 in
  "-gamp5")
		pandoc docs/ISPE_GAMP_5/*.md --metadata-file=config/meta-pdf.yml -o ISPE_GAMP_5.pdf
		echo "Finish export ISPE GAMP 5 Computerized Systems to PDF"
		pandoc docs/ISPE_GAMP_5/*.md --epub-cover-image=docs/ISPE_GAMP_5/img/portrait-logo.png -o ISPE_GAMP_5.epub -t epub2
		echo "Finish export ISPE GAMP 5 Computerized Systems to ePub"
		pandoc docs/ISPE_GAMP_5/*.md -o ISPE_GAMP_5.docx
		echo "Finish export ISPE GAMP 5 Computerized Systems to Word"
	;;
	"-infra")
		pandoc docs/ISPE_GAMP_Infrastructure/*.md --metadata-file=config/meta-pdf.yml -o ISPE_GAMP_Infrastructure.pdf
		echo "Finish export ISPE GAMP Infrastructure IT to PDF"
		pandoc docs/ISPE_GAMP_Infrastructure/*.md -o ISPE_GAMP_Infrastructure.epub -t epub2
		echo "Finish export ISPE GAMP Infrastructure IT to ePub"
		pandoc docs/ISPE_GAMP_Infrastructure/*.md -o ISPE_GAMP_Infrastructure.docx
		echo "Finish export ISPE GAMP Infrastructure IT to Word"
	;;
	"-lab")
		pandoc docs/ISPE_GAMP_Laboratory/*.md --metadata-file=config/meta-pdf.yml -o ISPE_GAMP_Laboratory.pdf
		echo "Finish export ISPE GAMP Laboratory Systems to PDF"
		pandoc docs/ISPE_GAMP_Laboratory/*.md -o ISPE_GAMP_Laboratory.epub -t epub2
		echo "Finish export ISPE GAMP Laboratory Systems to ePub"
		pandoc docs/ISPE_GAMP_Laboratory/*.md -o ISPE_GAMP_Laboratory.docx
		echo "Finish export ISPE GAMP Laboratory Systems to Word"
	;;
	"-data")
		pandoc docs/ISPE_GAMP_DataIntegrity/*.md --metadata-file=config/meta-pdf.yml -o ISPE_GAMP_DataIntegrity.pdf
		echo "Finish export ISPE GAMP Records and Data Integrity to PDF"
		pandoc docs/ISPE_GAMP_DataIntegrity/*.md -o ISPE_GAMP_DataIntegrity.epub -t epub2
		echo "Finish export ISPE GAMP Records and Data Integrity to ePub"
		pandoc docs/ISPE_GAMP_DataIntegrity/*.md -o ISPE_GAMP_DataIntegrity.docx
		echo "Finish export ISPE GAMP Records and Data Integrity to Word"
	;;
	"-lib4317")
		pandoc docs/FDA_LIB_4317/*.md --metadata-file=config/meta-pdf.yml -o FDA_LIB_4317.pdf
		echo "Finish export FDA LIB 4317 to PDF"
		pandoc docs/FDA_LIB_4317/*.md -o FDA_LIB_4317.epub -t epub2
		echo "Finish export FDA LIB 4317 to to ePub"
		pandoc docs/FDA_LIB_4317/*.md -o FDA_LIB_4317.docx
		echo "Finish export FDA LIB 4317 to to Word"
	;;
esac