baseCommand: [converter.sh]
class: CommandLineTool
cwlVersion: cwl:draft-3
description: Convert Kallisto output to list format
hints: []
inputs:
- id: input
  inputBinding: {position: 1}
  type: File
- {id: output, type: string}
name: converter.cwl
outputs:
- id: tableout
  outputBinding: {glob: $(inputs.output)}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: zhanghjumich/kallisto}
stdout: $(inputs.output)
