#!/usr/bin/env cwl-runner

class: CommandLineTool
id: Seqware-Sanger-Somatic-Workflow
label: Seqware-Sanger-Somatic-Workflow

$namespaces:
  foaf: http://xmlns.com/foaf/0.1/

dct:creator:
  '@id': http://sanger.ac.uk/...
  foaf:name: Keiran Raine
  foaf:mbox: mailto:keiranmraine@gmail.com

dct:contributor:
  - foaf:name: Brian O'Connor
    foaf:mbox: mailto:broconno@ucsc.edu
  - foaf:name: Denis Yuen
    foaf:mbox: mailto:denis.yuen@oicr.on.ca

requirements:
- class: DockerRequirement
  dockerPull: cuhkhaosun/workflow-pancancer:sanger-cgp-workflow-latest

cwlVersion: v1.0

inputs:
  tumor:
    type: File
    inputBinding:
      position: 1
      prefix: --tumor
    secondaryFiles:
    - .bai
  refFrom:
    type: File
    inputBinding:
      position: 3
      prefix: --refFrom
  bbFrom:
    type: File
    inputBinding:
      position: 4
      prefix: --bbFrom
  normal:
    type: File
    inputBinding:
      position: 2
      prefix: --normal
    secondaryFiles:
    - .bai
  coreNum:
    type: int?
    inputBinding:
      position: 5
      prefix: --coreNum
  memGB:
    type: int?
    inputBinding:
      position: 6
      prefix: --memGB
  run-id:
    type: string?
    inputBinding:
      position: 7
      prefix: --run-id

outputs:
  somatic_cnv_vcf_gz:
    type: File
    outputBinding:
      glob: '*.somatic.cnv.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  somatic_cnv_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.cnv.tar.gz'
    secondaryFiles:
    - .md5
  somatic_indel_vcf_gz:
    type: File
    outputBinding:
      glob: '*.somatic.indel.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  somatic_indel_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.indel.tar.gz'
    secondaryFiles:
    - .md5
  somatic_sv_vcf_gz:
    type: File
    outputBinding:
      glob: '*.somatic.sv.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  somatic_sv_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.sv.tar.gz'
    secondaryFiles:
    - .md5
  somatic_snv_mnv_vcf_gz:
    type: File
    outputBinding:
      glob: '*.somatic.snv_mnv.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  somatic_snv_mnv_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.snv_mnv.tar.gz'
    secondaryFiles:
    - .md5
  somatic_genotype_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.genotype.tar.gz'
    secondaryFiles:
    - .md5
  somatic_imputeCounts_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.imputeCounts.tar.gz'
    secondaryFiles:
    - .md5
  somatic_verifyBamId_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.verifyBamId.tar.gz'
    secondaryFiles:
    - .md5
  bas_tar_gz:
    type: File
    outputBinding:
      glob: '*.bas.tar.gz'
    secondaryFiles:
    - .md5
  qc_metrics:
    type: File
    outputBinding:
      glob: '*.qc_metrics.tar.gz'
    secondaryFiles:
    - .md5
  timing_metrics:
    type: File
    outputBinding:
      glob: '*.timing_metrics.tar.gz'
    secondaryFiles:
    - .md5


baseCommand: [/start.sh, python, /home/seqware/CGP-Somatic-Docker/scripts/run_seqware_workflow.py]
