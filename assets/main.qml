import bb.cascades 1.0

Page 
{   
    property int maxCharacters : 100
    property int charactersLeft : 0
    property string appurl : "http://magtxt.org/messenger.html"
    property string appname : "PINOY FREE SMS"
    
    property string appworldid : "39340954"
    property string appworldappurl: "appworld://content/" + appworldid
    property string appworldshareurl: "http://appworld.blackberry.com/webstore/content/" + appworldid
    
    actions: 
    [
        
	    ActionItem 
	    {
		    title: "Refresh"
		    imageSource: "asset:///images/refresh.png"
		    ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered:
            {
                browser.url = appurl;
            }
	    },
	    ActionItem 
        {
            title: "Send"
            ActionBar.placement: ActionBarPlacement.OnBar
            enabled: btnSend.enabled
            imageSource: "asset:///images/send.png"
            onTriggered: 
            {
                send();
            }
        }
    ]
    
    titleBar: TitleBar 
    {
        title: "PH FREE SMS"
        
        dismissAction: ActionItem 
        {
            imageSource: "asset:///images/refresh.png"
            onTriggered:
            {
            	browser.url = appurl;
            }
        }
        
        acceptAction: ActionItem 
        {
            id: btnSend
            enabled: false
            imageSource: "asset:///images/send.png"
            onTriggered:
            {
                send();
            }
        }
    }
    Container 
    {
        topPadding: 30
        bottomPadding: 30
        leftPadding: 30
        rightPadding: 30
        
        ScrollView 
        {
        	Container 
        	{
                bottomPadding: 200
                
                Header 
                {
                    title: "Recipient Phone Number | MAX: 7"    
                }
                
                Container 
                {
                    topMargin: 20
                    
                    layout: StackLayout 
                    {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    
                    DropDown
                    {
                        id: preNumber
                        
                        layoutProperties: StackLayoutProperties 
                        {
                            spaceQuota: 1
                        }
                        
                        selectedIndex: _app.getSetting("preNumber", "0");
                        
                        options: 
                        [
                            Option 
                            {
                                text: "0905"
                            },
                            Option 
                            {
                                text: "0906"
                            }
                            ,
                            Option 
                            {
                                text: "0907"
                            }
                            ,
                            Option 
                            {
                                text: "0908"
                            },
                            Option 
                            {
                                text: "0909"
                            },
                            Option 
                            {
                                text: "0910"
                            },
                            Option 
                            {
                                text: "0912"
                            },
                            Option 
                            {
                                text: "0915"
                            },
                            Option 
                            {
                                text: "0916"
                            },
                            Option 
                            {
                                text: "0917"
                            },
                            Option 
                            {
                                text: "0918"
                            },
                            Option 
                            {
                                text: "0919"
                            },
                            Option 
                            {
                                text: "0920"
                            },
                            Option 
                            {
                                text: "0921"
                            },
                            Option 
                            {
                                text: "0922"
                            },
                            Option 
                            {
                                text: "0923"
                            },
                            Option 
                            {
                                text: "0925"
                            },
                            Option 
                            {
                                text: "0926"
                            },
                            Option 
                            {
                                text: "0927"
                            },
                            Option 
                            {
                                text: "0928"
                            },
                            Option 
                            {
                                text: "0929"
                            },
                            Option 
                            {
                                text: "0930"
                            },
                            Option 
                            {
                                text: "0932"
                            },
                            Option 
                            {
                                text: "0933"
                            },
                            Option 
                            {
                                text: "0934"
                            },
                            Option 
                            {
                                text: "0935"
                            },
                            Option 
                            {
                                text: "0936"
                            },
                            Option 
                            {
                                text: "0937"
                            },
                            Option 
                            {
                                text: "0938"
                            },
                            Option 
                            {
                                text: "0939"
                            },
                            Option 
                            {
                                text: "0942"
                            },
                            Option 
                            {
                                text: "0943"
                            },
                            Option 
                            {
                                text: "0946"
                            },
                            Option 
                            {
                                text: "0947"
                            },
                            Option 
                            {
                                text: "0948"
                            },
                            Option 
                            {
                                text: "0949"
                            },
                            Option 
                            {
                                text: "0989"
                            },
                            Option 
                            {
                                text: "0994"
                            },
                            Option 
                            {
                                text: "0996"
                            },
                            Option 
                            {
                                text: "0997"
                            },
                            Option 
                            {
                                text: "0998"
                            },
                            Option 
                            {
                                text: "0999"
                            }
                        ]
                    }
                    
                    TextField
                    {
                        id: postNumber
                        text: _app.getSetting("postNumber", "");
                        
                        layoutProperties: StackLayoutProperties 
                        {
                            spaceQuota: 2
                        }
                        
                        hintText: "ex: 7595887"
                        inputMode: TextFieldInputMode.PhoneNumber
                        //maximumLength: 7
                    }
                }
                
                Header 
                {
                    title: "Sender Name | MAX: 6"
                    topMargin: 30
                }
                
                TextField
                {
                    id: senderName
                    hintText: "ex: Oliver"
                    //maximumLength: 6
                }
                
                Header 
                {
                    id: messageTitle
                    title: "Message | Characters Left: 100"
                    topMargin: 30
                }
                
                TextArea
                {
                    id: message
                    hintText: "Your message here. Ex. Hello NemOry! :)"
                    maximumLength: maxCharacters
                    minHeight: 200
                    
                    onTextChanging: 
                    {
                        charactersLeft = (maxCharacters - message.text.length);
                        messageTitle.title = "Message | Characters Left: " + charactersLeft;
                    }
                }
                
                Header 
                {
                    title: "Captcha"
                    topMargin: 30
                }
                
                ProgressIndicator 
                {
                    id: progressBar
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                WebView
                {
                    id: browserCaptcha
                    visible: true
                }
                
                TextField
                {
                    id: captcha
                    hintText: "Enter the captcha code you see above."
                }
                
                WebView 
                {
                    id: browser
                    visible: false
                    url: appurl
   
                    onMessageReceived: 
                    {
                        console.log("MESSAGE: " + message.data);
                        
                        if(_app.contains(message.data, "<img"))
                        {
                            browserCaptcha.html = message.data;
                        }
                        else if(_app.contains(message.data, "invalid"))
                        {
                            browser.url = appurl;
                            _app.showDialog("Error", "Invalid Captcha Entered. Please try again. :(");
                            captcha.text = "";
                        }
                        else if(_app.contains(message.data, "Message sent"))
                        {
                            browser.url = appurl;
                            _app.showToast("Success",  "Your message was successfully sent. :)");
                        }
                        
                        _app.hideProgressDialog();
                    }
                    
                    onLoadingChanged: 
                    {
                        if (loadRequest.status == WebLoadStatus.Started) 
                        {
                            progressBar.visible = true;
                        }
                        else if (loadRequest.status == WebLoadStatus.Succeeded) 
                        {
                            if(loadRequest.url == "http://www.magtxt.org/messenger.php")
                            {
                                browser.evaluateJavaScript("navigator.cascades.postMessage(document.getElementsByClassName('perimeterSpacingInner')[0].innerHTML);");
                            }
                            else 
                            {
                                btnSend.enabled = true;
                                progressBar.visible = false
                                browser.evaluateJavaScript("document.getElementById('recaptcha_image').getElementsByTagName('img')[0].height = 114;");
                                browser.evaluateJavaScript("document.getElementById('recaptcha_image').getElementsByTagName('img')[0].width = 600;");
                                browser.evaluateJavaScript("navigator.cascades.postMessage(document.getElementById('recaptcha_image').innerHTML);");
                            }     
                        }
                        else if (loadRequest.status == WebLoadStatus.Failed)
                        {
                            progressBar.visible = false
                            _app.showToast("Failed to load the Captcha. Please double check you are connected to the Internet.");
                        }
                    }
                    
                    onLoadProgressChanged: 
                    {
                        progressBar.value = loadProgress / 100.0;
                    }
                }               
            }
        }
    }
    
    attachedObjects: 
    [
        Invocation 
        {
            id: invokeShare
            query  
            {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
                invokerIncluded: true
                data: "Checkout " + appname + ", the FREE SMS Application to #Philippines for #BlackBerry10: " + appworldshareurl + " #teamblackberry @pinoybbdev"
            }
        },
        AboutSheet  
        {
            id: aboutSheet
        }
    ]
    
    Menu.definition: MenuDefinition 
    {
        actions: 
        [
            ActionItem 
            {
                title: "About"
                imageSource: "asset:///images/about.png"
                onTriggered: 
                {
                    aboutSheet.open();
                }
            },
            ActionItem  
            {
                title: "Contact Us"
                imageSource: "asset:///images/contact.png"
                onTriggered: 
                {
                    _app.invokeEmail("nemoryoliver@gmail.com", "Support : " + appname, "How may we help you?\n\n")
                }
            },
            ActionItem 
            {
                title: "Share Our App"
                imageSource: "asset:///images/share.png"
                onTriggered:
                {
                    invokeShare.trigger("bb.action.SHARE")
                }
            },
            ActionItem 
            {
                title: "Rate Our App"
                imageSource: "asset:///images/rate.png"
                onTriggered:
                {
                    _app.invokeBBWorld(appworldappurl);
                }
            }
        ]
    }
    
    function send()
    {
        _app.setSetting("postNumber", postNumber.text);
        _app.setSetting("preNumber", preNumber.selectedIndex);
        
        if(
	        postNumber.text.length == 7 && 
	        senderName.text.length > 0 && 
	        message.text.length > 0 && 
	        captcha.text.length > 0
        )	
        {
            // inject prefix phone number
            browser.evaluateJavaScript("document.getElementsByName('prefix')[0].options.selectedIndex = "+ preNumber.selectedIndex +";");
            
            // inject postfix phone number
            browser.evaluateJavaScript("document.getElementsByName('postfix')[0].value = '"+ postNumber.text +"';");
            
            // inject sender name
            browser.evaluateJavaScript("document.getElementsByName('sender')[0].value = '"+ senderName.text +"';");
            
            // inject message
            browser.evaluateJavaScript("document.getElementsByName('message')[0].value = '"+ message.text +"';");
            
            // inject captcha
            browser.evaluateJavaScript("document.getElementById('recaptcha_response_field').value = '"+ captcha.text +"';");
            
            // inject characters left
            browser.evaluateJavaScript("document.getElementsByName('charcounter')[0].value = '"+ charactersLeft +"';");
            
            // inject sent count
            browser.evaluateJavaScript("document.getElementsByName('sentcount')[0].value = '0';");
            
            // inject senderid
            browser.evaluateJavaScript("document.getElementsByName('senderid')[0].value = '0';");
            
            // click send
            browser.evaluateJavaScript("document.getElementsByClassName('buttonCustomized cursorShowPointer')[0].click();");
            
            _app.showProgressDialog("Sending Your SMS...", "Please wait....");
        }
        else 
        {
            var warningmessage = "";
            
            if(postNumber.text.length != 7)
            {
                warningmessage += "* Recipient's postfix number must be 7 digits. \n";
            }
            
            if(senderName.text.length > 6)
            {
                warningmessage += "* Sender Name is only upto 6 characters. \n";
            }
            
            if(senderName.text.length == 0)
            {
                warningmessage += "* Sender Name is required. \n";
            }
            
            if(message.text.length == 0)
            {
                warningmessage += "* Message is required. \n";
            }
            
            if(captcha.text.length == 0)
            {
                warningmessage += "* Captcha is required. \n";
            }
            
            _app.showDialog("Warning", warningmessage);
        }
    }
}
