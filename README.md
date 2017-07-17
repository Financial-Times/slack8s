# Kubernetes Events Slack Bot (slack8s)

Kubernetes Slack Integration - Infinite loop go program which queries the Kubernetes Event Stream API and
posts messages to slack for important events.

This has been forked, and the settings changed to alert the way we want it to.

## Limitations

1. This does not keep track of which notifications it has sent. You should not
trust that slack has every event.
2. When the container dies, if the container takes more than 3 minute to spawn,
some events will not be posted to slack.
3. When the container dies, events within 3 minute of the restart will be posted
to Slack twice.
4. The watch api seems to hit EOF causing this container to die more often than
desired. On a busy cluster, the above limitations are more obvious because of this.
5. Do not attempt to use this as a replacement for a pager.

## Alerting thresholds
slack8s will push an event to slack if the type is Warning, and the count is less than 10.
This stops it spamming the channel

