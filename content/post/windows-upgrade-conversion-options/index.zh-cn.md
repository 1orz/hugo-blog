---
title: "Windows 升级/版本转换 激活"
slug: "windows-upgrade-conversion-activate"
description: "- 了解Windows升级/版本转换 以及激活那些事儿"
date: 2023-11-23T22:48:32+08:00
lastmod: 2023-11-25T22:48:32+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [笔记]
tags: [windows,kms]
---

## 前言

今天准备在家里的服务器(基于 VMWare vShpare 8 虚拟化的)上安装一个`Windows Server 2022`

以便运行`Sons of the Forest Delicated Server`

~~走过了很多坑~~

Windows Server 2022 有三个版本:

+ `Windows Server 2022 Standard`
+ `Windows Server 2022 Datacenter`
+ `Windows Server 2022 Datacenter：Azure Edition`

根据需求 及实际情况 我选择了 `Windows Server 2022 Datacenter`

而对于普通用户可下载到的，即可直接接触到的版本只有评估版。

~~对于学习和使用来说。评估版是完全够用的。~~

评估期限只有180天。超过180天适用期 我也不知道会发生什么 查阅资料说会出现自动关机的现象。

## 步骤

### 下载评估版镜像

[评估版本下载地址](https://www.microsoft.com/zh-cn/evalcenter/download-windows-server-2022)

### 安装操作系统

省略 此处不赘述 请自行安装 按需求选择版本 安装完成后进入系统 以下操作均在系统内进行 请注意

### 版本转换

+ <kbd>Win</kbd> + <kbd>R</kbd> 打开 `PowerShell`

```powershell
DISM /online /Get-CurrentEdition # 可选 查看当前版本
DISM /online /Get-TargetEditions # 可选 查看可升级版本
DISM /online /Set-Edition:ServerDatacenter /ProductKey:WX4NM-KYWYW-QJJR4-XV3QB-6VM33 /AcceptEula # 升级到零售版
```

随后重启系统 完成版本转换

### 激活

+ <kbd>Win</kbd> + <kbd>R</kbd> 打开 `PowerShell`

```powershell
slmgr.vbs -upk #卸载旧的密钥 新安装可忽略 可选
slmgr.vbs -ipk WX4NM-KYWYW-QJJR4-XV3QB-6VM33 # 仅适用于windows server 2022 datacenter
slmgr.vbs -skms kms-default.cangshui.net #设置kms服务器
slmgr.vbs -ato  #激活
slmgr.vbs -dlv #激活并查看激活信息 可选
```

Windows Server系列

|       操作系统版本       |      KMS 客户端产品密钥       |
| :----------------------: | :---------------------------: |
|        Datacenter        | WX4NM-KYWYW-QJJR4-XV3QB-6VM33 |
| Datacenter Azure Edition | NTBV8-9K7Q8-V27C6-M2BTV-KHMXV |
|         Standard         | VDYBN-27WPP-V4HQT-9VMD4-VMK7H |

## 引用

+ [评估版本下载地址](https://www.microsoft.com/zh-cn/evalcenter/download-windows-server-2022)

+ [适用于 Windows Server 的升级和转换选项](https://learn.microsoft.com/zh-cn/windows-server/get-started/upgrade-conversion-options#windows-server-standard-or-datacenter)

+ [激活密钥一览表-官方地址](https://learn.microsoft.com/zh-cn/windows-server/get-started/kms-client-activation-keys)

+ [沧水kms](https://kms.cangshui.net/) 

## 附录

| 操作系统版本                                | KMS 客户端产品密钥            |
| ------------------------------------------- | ----------------------------- |
| **Windows Server 2022**                     |                               |
| Datacenter                                  | WX4NM-KYWYW-QJJR4-XV3QB-6VM33 |
| Datacenter Azure Edition                    | NTBV8-9K7Q8-V27C6-M2BTV-KHMXV |
| Standard                                    | VDYBN-27WPP-V4HQT-9VMD4-VMK7H |
| **Windows Server 2019**                     |                               |
| Datacenter                                  | WMDGN-G9PQG-XVVXX-R3X43-63DFG |
| Standard                                    | N69G4-B89J2-4G8F4-WWYCC-J464C |
| Essentials                                  | WVDHN-86M7X-466P6-VHXV7-YY726 |
| **Windows Server 2016**                     |                               |
| Datacenter                                  | CB7KF-BWN84-R7R2Y-793K2-8XDDG |
| Standard                                    | WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY |
| Essentials                                  | JCKRF-N37P4-C2D82-9YXRT-4M63B |
| **Windows Server (半年频道版本)**           |                               |
| Datacenter (20H2, 2004, 1909, 1903, 1809)   | 6NMRW-2C8FM-D24W7-TQWMY-CWH2D |
| Standard                                    | N2KJX-J94YW-TQVFB-DG9YT-724CC |
| **Windows 11 和 Windows 10 (半年频道版本)** |                               |
| 专业版                                      | W269N-WFGWX-YVC9B-4J6C9-T83GX |
| 专业版 N                                    | MH37W-N47XK-V7XM9-C7227-GCQG9 |
| 专业工作站版                                | NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J |
| 专业工作站版 N                              | 9FNHH-K3HBT-3W4TD-6383H-6XYWF |
| 专业教育版                                  | 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y |
| 专业教育版 N                                | YVWGF-BXNMC-HTQYQ-CPQ99-66QFC |
| 教育版                                      | NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 |
| 教育版 N                                    | 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ |
| 企业版                                      | NPPR9-FWDCX-D2C8J-H872K-2YT43 |
| 企业版 N                                    | DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 |
| 企业版 G                                    | YYVX9-NTFWV-6MDM3-9PT4T-4M68B |
| 企业版 G N                                  | 44RPN-FTY23-9VTTB-MP9BX-T84FV |
| **Windows 10 (LTSC/LTSB 版本)**             |                               |
| 企业版 LTSC 2021                            | M7XTQ-FN8P6-TTKYV-9D4CC-J462D |
| 企业版 N LTSC 2021                          | 92NFX-8DJQP-P6BBQ-THF9C-7CG2H |
| 企业版 LTSB 2016                            | DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ |
| 企业版 N LTSB 2016                          | QFFDN-GRT3P-VKWWX-X7T3R-8B639 |
| 企业版 2015 LTSB                            | WNMTR-4C88C-JK8YV-HQ7T2-76DF9 |
| 企业版 2015 LTSB N                          | 2F77B-TNFGY-69QQF-B8YKP-D69TJ |
| **早期版本的 Windows Server**               |                               |
| 1803 Datacenter                             | 2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG |
| 1803 Standard                               | PTXN8-JFHJM-4WC78-MPCBR-9W4KR |
| 1709 Datacenter                             | 6Y6KB-N82V8-D8CQV-23MJW-BWTG6 |
| 1709 Standard                               | DPCNP-XQFKJ-BJF7R-FRC8D-GF6G4 |
| 2012 R2 Standard                            | D2N9P-3P6X9-2R39C-7RTCD-MDVJX |
| 2012 R2 Datacenter                          | W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9 |
| 2012 R2 Essentials                          | KNC87-3J2TX-XB4WP-VCPJV-M4FWM |
| 2012                                        | BN3D2-R7TKB-3YPBD-8DRP2-27GG4 |
| 2012 N                                      | 8N2M2-HWPGY-7PGT9-HGDD8-GVGGY |
| 2012 单语言版                               | 2WN2H-YGCQR-KFX6K-CD6TF-84YXQ |
| 2012 特定国家/地区版                        | 4K36P-JN4VD-GDC6V-KDT89-DYFKP |
| 2012 Standard                               | XC9B7-NBPP2-83J2H-RHMBY-92BT4 |
| 2012 MultiPoint 标准版                      | HM7DN-YVMH3-46JC3-XYTG7-CYQJJ |
| 2012 MultiPoint 高级版                      | XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G |
| 2012 Datacenter                             | 48HP8-DN98B-MYWDG-T2DCC-8W83P |
| 2012 Essentials                             | HTDQM-NBMMG-KGYDT-2DTKT-J2MPV |
| 2008 R2 Web 版                              | 6TPJF-RBVHG-WBW2R-86QPH-6RTM4 |
| 2008 R2 HPC 版                              | TT8MH-CG224-D3D7Q-498W2-9QCTX |
| 2008 R2 标准版                              | YC6KT-GKW9T-YTKYR-T4X34-R7VHC |
| 2008 R2 企业版                              | 489J6-VHDMP-X63PK-3K798-CPX3Y |
| 2008 R2 Datacenter                          | 74YFP-3QFB3-KQT8W-PMXWJ-7M648 |
| Itanium 系统的 2008 R2                      | GT63C-RJFQ3-4GMB6-BRFB9-CB83V |
| 2008 Server Web 版                          | WYR28-R7TFJ-3X2YQ-YCY4H-M249D |
| 2008 标准版                                 | TM24T-X9RMF-VWXK6-X8JC9-BFGM2 |
| 不带 Hyper-V 的 2008 标准版                 | W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ |
| 2008 企业版                                 | YQGMW-MPWTJ-34KDK-48M3W-X4Q6V |
| 不带 Hyper-V 的 2008 企业版                 | 39BXF-X8Q23-P2WWT-38T2F-G3FPG |
| 2008 HPC                                    | RCTX3-KWVHP-BR6TB-RB6DM-6X7HP |
| 2008 Datacenter                             | 7M67G-PC374-GR742-YH8V4-TCBY3 |
| 不带 Hyper-V 的 2008 数据中心版             | 22XQ2-VRXRG-P8D42-K34TD-G3QQC |
| Itanium 系统的 2008                         | 4DWFP-JF3DJ-B7DTH-78FJB-PDRHK |
| **早期版本的 Windows**                      |                               |
| 8.1 专业版                                  | GCRJD-8NW9H-F2CDX-CCM8D-9D6T9 |
| 8.1 专业版 N                                | HMCNV-VVBFX-7HMBH-CTY9B-B4FXY |
| 8.1 企业版                                  | MHF9N-XY6XB-WVXMC-BTDCT-MKKG7 |
| 8.1 企业版 N                                | TT4HM-HN7YT-62K67-RGRQJ-JFFXW |
| Windows 8 专业版                            | NG4HW-VH26C-733KW-K6F98-J8CK4 |
| Windows 8 专业版 N                          | XCVCF-2NXM9-723PB-MHCB7-2RYQQ |
| Windows 8 企业版                            | 32JNW-9KQ84-P47T8-D8GGY-CWCK7 |
| Windows 8 企业版 N                          | JMNMF-RHW7P-DMY6X-RF3DR-X2BQT |
| Windows 7 专业版                            | FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4 |
| Windows 7 专业版 N                          | MRPKT-YTG23-K7D7T-X2JMM-QY7MG |
| Windows 7 专业版 E                          | W82YF-2Q76Y-63HXB-FGJG9-GF7QX |
| Windows 7 企业版                            | 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH |
| Windows 7 企业版 N                          | YDRBP-3D83W-TY26F-D46B2-XCKRJ |
| Windows 7 企业版 E                          | C29WB-22CC8-VJ326-GHFJW-H9DH4 |
| **Windows Vista**                           |                               |
| 商用版                                      | YFKBB-PQJJV-G996G-VWGXY-2V3X8 |
| 商用版 N                                    | HMBQG-8H2RH-C77VX-27R82-VMQBT |
| 企业版                                      | VKK3X-68KWM-X2YGT-QR4M6-4BWMV |
| 企业版 N                                    | VTC42-BM838-43QHV-84HX6-XJXKV |
