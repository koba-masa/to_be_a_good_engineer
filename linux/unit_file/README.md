# systemdのユニットファイル
## 配置場所
### システム管理者用
- `/etc/systemd/system/`

## ファイル名
- `<unit_name>.<type_extension>`
  - `nginx.service`

||||
|:--|:--|:--|
|`unit_name`|ユニット名||
|`type_extension`|ユニットタイプ|[参考](https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-managing_services_with_systemd#tabl-Managing_Services_with_systemd-Introduction-Units-Types)|


## 構造
### Unitセクション
||||
|:--|:--|:--|
|`Description`||ユニットの説明|
|`Documentation`|||
|`After`||指定したユニットがアクティブになった後に実行される|
|`Before`||指定したユニットがアクティブになる前にに実行される|
|`Requires`|||
|`Wants`|||
|`Conflicts`|||
|`Requisite`|||
|`BindsTo`|||
|`PartOf`|||
|`Upholds`|||
|`OnFailure`|||
|`OnSuccess`|||
|`ReloadPropagatedFrom`|||
|`PropagatesReloadTo`|||
|`StopPropagatedFrom`|||
|`PropagatesStopTo`|||
|`JoinsNamespaceOf`|||
|`RequiresMountsFor`|||
|`OnFailureJobMode`|||
|`IgnoreOnIsolate`|||
|`StopWhenUnneeded`|||
|`RefuseManualStart`|||
|`RefuseManualStop`|||
|`AllowIsolate`|||
|`DefaultDependencies`|||
|`CollectMode`|||
|`SuccessAction`|||
|`FailureAction`|||
|`SuccessActionExitStatus`|||
|`FailureActionExitStatus`|||
|`JobTimeoutSec`|||
|`JobRunningTimeoutSec`|||
|`JobTimeoutAction`|||
|`JobTimeoutRebootArgument`|||
|`StartLimitIntervalSec=interval`|||
|`StartLimitBurst=burst`|||
|`StartLimitAction`|||
|`RebootArgument`|||
|`SourcePath`|||

#### 記載例
```
[Unit]
Description=Postfix Mail Transport Agent
After=syslog.target network.target
Conflicts=sendmail.service exim.service
```

### Serviceセクション
|||||
|:--|:--|:--|:--|
|`Type`|||ユニットプロセスの起動タイプを指定する|
||-|`simple`||
||-|`forking`||
||-|`oneshot`||
||-|`dbus`||
||-|`notify`||
||-|`idle`||
|`ExecStart`|||ユニット開始時に実行するコマンド・スクリプトを指定する|
|`ExecStop`|||ユニット停止時に実行するコマンド・スクリプトを指定する|
|`ExecReload`|||ユニット再読込時に実行するコマンド・スクリプトを指定する|
|`Restart`||||
|`RemainAfterExit`||`False`/`True`|すでてのプロセスが全て修了していても、アクティブと見なされる|
|`ExitType`||||
||-|`main`||
||-|`cgroup`||
|`RemainAfterExit`||||
|`GuessMainPID`||||
|`PIDFile`||||
|`BusName`||||
|`ExecStartPost`||||
|`ExecStartPre`||||
|`ExecCondition`||||
|`ExecStopPost`||||
|`RestartSec`||||
|`TimeoutStartSec`||||
|`TimeoutStopSec`||||
|`TimeoutAbortSec`||||
|`TimeoutSec`||||
|`TimeoutStartFailureMode`||||
|`TimeoutStopFailureMode`||||
|`RuntimeMaxSec`||||
|`RuntimeRandomizedExtraSec`||||
|`WatchdogSec`||||
|`SuccessExitStatus`||||
|`RestartPreventExitStatus`||||
|`RestartForceExitStatus`||||
|`RootDirectoryStartOnly`||||
|`NonBlocking`||||
|`NotifyAccess`||||
|`Sockets`||||
|`FileDescriptorStoreMax`||||
|`USBFunctionDescriptors`||||
|`USBFunctionStrings`||||
|`OOMPolicy`||||

#### 記載例
```
[Service]
Type=forking
PIDFile=/var/spool/postfix/pid/master.pid
EnvironmentFile=-/etc/sysconfig/network
ExecStartPre=-/usr/libexec/postfix/aliasesdb
ExecStartPre=-/usr/libexec/postfix/chroot-update
ExecStart=/usr/sbin/postfix start
ExecReload=/usr/sbin/postfix reload
ExecStop=/usr/sbin/postfix stop
```

### Installセクション
||||
|:--|:--|:--|
|`Alias`|||
|`RequiredBy`|||
|`WantedBy`|||
|`Also`|||
|`DefaultInstance`|||

#### 記載例
```
[Install]
WantedBy=multi-user.target
```

## 更新時の手順
以下のコマンドを実行する
```sh
chmod 664 /etc/systemd/system/<unit_name>.<type_extension>
systemctl daemon-reload
```

## 参考
- [ユニットファイル構造の概要](https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-unit_files#sect-Managing_Services_with_systemd-Unit_File_Structure)
