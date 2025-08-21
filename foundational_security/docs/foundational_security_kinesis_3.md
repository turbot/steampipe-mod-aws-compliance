## Description

This control checks whether an Amazon Kinesis data stream has a data retention period greater than or equal to the specified time frame. The control fails if the data retention period is less than the specified time frame. Unless you provide a custom parameter value for the data retention period, Security Hub uses a default value of 168 hours.

In Kinesis Data Streams, a data stream is an ordered sequence of data records meant to be written to and read from in real time. Data records are stored in shards in your stream temporarily. The time period from when a record is added to when it is no longer accessible is called the retention period. Kinesis Data Streams almost immediately makes records older than the new retention period inaccessible after decreasing the retention period. For example, changing the retention period from 24 hours to 48 hours means that records added to the stream 23 hours 55 minutes prior are still available after 24 hours.

## Remediation

To change the backup retention period for your Kinesis Data Streams, see [Change the data retention period](https://docs.aws.amazon.com/streams/latest/dev/kinesis-extended-retention.html) in the Amazon Kinesis Data Streams Developer Guide