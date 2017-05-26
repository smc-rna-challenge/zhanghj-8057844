baseCommand: [kallisto, quant]
class: CommandLineTool
cwlVersion: cwl:draft-3
description: Kallisto
hints: []
inputs:
- id: fastq1
  inputBinding: {position: 1}
  type: File
- id: fastq2
  inputBinding: {position: 2}
  type: File
- id: index
  inputBinding: {position: 3, prefix: -i}
  type: File
- id: outdir
  inputBinding: {position: 4, prefix: -o}
  type: string
name: kallisto.cwl
outputs:
- id: output
  outputBinding: {glob: $(inputs.outdir+'/abundance.tsv')}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: zhanghjumich/kallisto}
