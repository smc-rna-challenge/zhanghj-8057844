class: Workflow
cwlVersion: cwl:draft-3
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': zhanghj@synapse.org,
  'foaf:name': zhanghj}
description: Infer transcript abundance
doc: 'SMC-RNA challenge isoform quantification submission

  '
hints: []
id: main
inputs:
- {id: index, type: File}
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
name: main
outputs:
- {id: OUTPUT, source: converter/tableout, type: File}
steps:
- id: kallisto
  inputs:
  - {id: index, source: index}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {default: out, id: outdir}
  outputs:
  - {id: output}
  run: kallisto.cwl
- id: converter
  inputs:
  - {id: input, source: kallisto/output}
  - {default: tpm, id: output}
  outputs:
  - {id: tableout}
  run: converter.cwl
