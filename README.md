# Documentos Markdown en formato ePUB, PDF y Word

## EL LUGAR de Carlos Gorostiza

   ```bash
   pandoc docs/EL_LUGAR/*.md --metadata-file=config/meta-pdf.yml -o EL_LUGAR.pdf
   pandoc docs/EL_LUGAR/*.md --metadata title="EL LUGAR, de Carlos Gorostiza" -o EL_LUGAR.epub -t epub2
   pandoc docs/EL_LUGAR/*.md -o EL_LUGAR.docx
   ```
