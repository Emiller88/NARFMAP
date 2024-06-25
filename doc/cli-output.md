```
dragenos -r <reference> -b <base calls> [optional arguments]

Command line options:
  --Aligner.pe-orientation arg                    Expected paired-end
                                                  orientation: 0=FR, 1=RF, 2=FF
  --Aligner.pe-stat-mean-insert arg (=0)          Expected mean of the insert
                                                  size
  --Aligner.pe-stat-mean-read-len arg (=0)        When setting paired-end
                                                  insert stats, the expected
                                                  mean read length
  --Aligner.pe-stat-quartiles-insert arg          Q25, Q50, and Q75 quartiles
                                                  for the insert size
  --Aligner.pe-stat-stddev-insert arg (=0)        Expected standard deviation
                                                  of the insert size
  --Aligner.rescue-ceil-factor arg (=3)           For tuning the rescue scan
                                                  window maximum ceiling
  --Aligner.rescue-sigmas arg (=0)                For tuning the rescue scan
                                                  window
  --Aligner.sec-aligns arg (=0)                   Maximum secondary
                                                  (suboptimal) alignments to
                                                  report per read
  --Aligner.sec-aligns-hard arg (=0)              Set to force unmapped when
                                                  not all secondary alignments
                                                  can be output
  --Aligner.sec-phred-delta arg (=0)              Only secondary alignments
                                                  with likelihood within this
                                                  phred of the primary
  --Aligner.sec-score-delta arg (=0)              Secondary aligns allowed with
                                                  pair score no more than this
                                                  far below primary
  --Aligner.smith-waterman-method arg             Smith Waterman implementation
                                                  (dragen / mengyao  default =
                                                  dragen)
  --Aligner.sw-all arg (=0)                       Value of 1 forces smith
                                                  waterman on all candidate
                                                  alignments
  --Mapper.filter-len-ratio arg (=4)              Ratio for controlling seed
                                                  chain filtering
  --RGID arg (=1)                                 Read Group ID
  --RGSM arg (=none)                              Read Group Sample
  -b [ --bam-input ] arg                          Input BAM file
  --build-hash-table arg (=0)                     Generate a reference/hash
                                                  table
  --enable-sampling arg (=1)                      Automatically detect
                                                  paired-end parameters by
                                                  running a sample through the
                                                  mapper/aligner
  -1 [ --fastq-file1 ] arg                        FASTQ file to send to card
                                                  (may be gzipped)
  -2 [ --fastq-file2 ] arg                        Second FASTQ file with
                                                  paired-end reads (may be
                                                  gzipped)
  --fastq-offset arg (=33)                        FASTQ quality offset value.
                                                  Set to 33 or 64
  -h [ --help ]                                   produce help message and exit
  --help-defaults                                 produce tab-delimited list of
                                                  command line options and
                                                  their default values
  --ht-anchor-bin-bits arg (=0)                   Bits defining reference bins
                                                  for anchored seed search
  --ht-cost-coeff-seed-freq arg (=0.5)            Cost coefficient of extended
                                                  seed frequency
  --ht-cost-coeff-seed-len arg (=1)               Cost coefficient of extended
                                                  seed length
  --ht-cost-penalty arg (=0)                      Cost penalty to extend a seed
                                                  by any number of bases
  --ht-cost-penalty-incr arg (=0.69999999999999996)
                                                  Cost penalty to incrementally
                                                  extend a seed another step
  --ht-crc-extended arg (=0)                      Index of CRC polynomial for
                                                  hashing extended seeds
  --ht-crc-primary arg (=0)                       Index of CRC polynomial for
                                                  hashing primary seeds
  --ht-decoys arg                                 Path to decoys file (FASTA
                                                  format)
  --ht-dump-int-params arg (=0)                   Testing - dump internal
                                                  parameters
  --ht-ext-rec-cost arg (=4)                      Cost penalty for each EXTEND
                                                  or INTERVAL record
  --ht-ext-table-alloc arg (=0)                   8-byte records to reserve in
                                                  extend_table.bin
                                                  (0=automatic)
  --ht-mask-bed arg                               Bed file for base masking
  --ht-max-dec-factor arg (=1)                    Maximum decimation factor for
                                                  seed thinning
  --ht-max-ext-incr arg (=12)                     Maximum bases to extend a
                                                  seed by in one step
  --ht-max-ext-seed-len arg (=0)                  Maximum extended seed length
  --ht-max-multi-base-seeds arg                   Maximum seeds populated at
                                                  multi-base codes
  --ht-max-seed-freq arg (=16)                    Maximum allowed frequency for
                                                  a seed match after extension
                                                  attempts
  --ht-max-seed-freq-len arg (=98)                Ramp from priMaxSeedFreq
                                                  reaches maxSeedFreq at this
                                                  seed length
  --ht-max-table-chunks arg                       Maximum ~1GB thread table
                                                  chunks in memory at once
  --ht-mem-limit arg (=0GB)                       Memory limit (hash table +
                                                  reference)
  --ht-methylated arg (=0)                        If set to true, generate C->T
                                                  and G->A converted pair of
                                                  hashtables
  --ht-min-repair-prob arg (=0.20000000000000001) Minimum probability of
                                                  success to attempt extended
                                                  seed repair
  --ht-num-threads arg                            Worker threads for generating
                                                  hash table
  --ht-override-size-check arg (=0)               Override hash table size
                                                  check
  --ht-pri-max-seed-freq arg (=0)                 Maximum frequency for a
                                                  primary seed match (0 => use
                                                  maxSeedFreq)
  --ht-rand-hit-extend arg (=8)                   Include a random hit with
                                                  each EXTEND record of this
                                                  frequency
  --ht-rand-hit-hifreq arg (=1)                   Include a random hit with
                                                  each HIFREQ record
  --ht-ref-seed-interval arg                      Number of positions per
                                                  reference seed
  --ht-reference arg                              Reference in FASTA format
  --ht-repair-strategy arg (=0)                   Seed extension repair
                                                  strategy: 0=none, 1=best,
                                                  2=rand
  --ht-seed-len arg (=21)                         Initial seed length to store
                                                  in hash table
  --ht-size arg (=0GB)                            Size of hash table, units
                                                  B|KB|MB|GB
  --ht-sj-size arg                                Reserved space for RNA
                                                  annotated SJs, units
                                                  B|KB|MB|GB
  --ht-soft-seed-freq-cap arg (=12)               Soft seed frequency cap for
                                                  thinning
  --ht-target-seed-freq arg (=4)                  Target seed frequency for
                                                  seed extension
  --ht-test-only arg (=0)                         Testing - show user
                                                  parameters, but don't do
                                                  anything
  --ht-uncompress arg (=0)                        Uncompress hash_table.cmp to
                                                  hash_table.bin and
                                                  extend_table.bin (standalone
                                                  option)
  --ht-write-hash-bin arg (=0)                    Write decompressed
                                                  hash_table.bin and
                                                  extend_table.bin (0/1)
  --input-qname-suffix-delimiter arg (= )         Character that delimits input
                                                  qname suffixes, e.g. / for /1
  --interleaved [=arg(=1)] (=0)                   Interleaved paired-end reads
                                                  in single bam or FASTQ
  --map-only arg (=0)                             no real alignment, produces
                                                  alignment information based
                                                  on seed chains only
  --mmap-reference arg (=0)                       memory-map reference data
                                                  instead of pre-loading. This
                                                  allows for quicker runs when
                                                  only a handful of reads need
                                                  to be aligned
  --num-threads arg (=16)                         Worker threads for
                                                  mapper/aligner (default =
                                                  maximum available on system)
  --output-directory arg                          Output directory
  --output-file-prefix arg                        Output filename prefix
  --pe-stats-interval-delay arg (=)              Number of intervals of lag
                                                  between sending reads and
                                                  using resulting stats
  --pe-stats-interval-memory arg (=
)             Include reads from up to this
                                                  many stats intervals in
                                                  paired-end stats calculations
  --pe-stats-interval-size arg (=25000)           Number of reads to include in
                                                  each interval of updating
                                                  paired-end stats
  --pe-stats-sample-size arg (=100000)            Number of most recent pairs
                                                  to include in each update of
                                                  the paired-end stats
  --preserve-map-align-order arg (=0)             Preserve the order of
                                                  mapper/aligner output to
                                                  produce deterministic
                                                  results. Impacts performance
  -r [ --ref-dir ] arg                            directory with reference and
                                                  hash tables. Must contain the
                                                  uncompressed hashtable.
  --ref-load-hash-bin arg (=0)                    Expect to find uncompressed
                                                  hash table in the reference
                                                  directory.
  --response-file arg                             file with more command line
                                                  arguments
  -v [ --verbose ]                                Be talkative
  -V [ --version ]                                print program version
                                                  information


Failed to parse the options: /build/i5zj4f8yjlk2spizc3krc2x4k1yqkvz1-source/src/lib/options/DragenOsOptions.cpp(335): Throw in function postProcess
Dynamic exception type: boost::wrapexcept<dragenos::common::InvalidOptionException>
std::exception::what: fastq-file1 or bam-input must point to an existing fastq file
```
