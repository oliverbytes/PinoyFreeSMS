import bb.cascades 1.0

Sheet 
{
    id: sheet
    peekEnabled: true
    
    Page 
    {
        titleBar: TitleBar 
        {
            title: "About"
            dismissAction: ActionItem 
            {
                title: "Close"
                onTriggered: 
                {
                    sheet.close();
                }
            }
        }
        
        ScrollView 
        {
            Container 
            {
                topPadding: 20
                leftPadding: 20
                rightPadding: 20
                bottomPadding: 20
                
                Header 
                {
                    title: "About The App"
                }
                
                ImageView 
                {
                    preferredWidth: 200
                    scalingMethod: ScalingMethod.AspectFit
                    imageSource: "asset:///images/icon.png"
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label 
                {
                    text: "This is a FREE TO USE FREE SMS Application for Filipinoes using BlackBerry 10. No matter where you are. This can save you time and money in sending SMS to your loveones in the Philippines. Powered by MagTXT."
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Header 
                {
                    title: "About The Developer"
                }
                
                ImageView 
                {
                    preferredWidth: 200
                    scalingMethod: ScalingMethod.AspectFit
                    imageSource: "asset:///images/nemory.png"
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label 
                {
                    text: "Core Developer: Oliver Martinez"
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label 
                {
                    text: "BBM: 2B10A199"
                    horizontalAlignment: HorizontalAlignment.Center
                    onTouch: 
                    {
                        if (event.isUp())
                        {
                            _app.invokeBBMInviteChat("2B10A199")
                        }
                    }
                }
                
                Label 
                {
                    text: "Email: nemoryoliver@gmail.com"
                    horizontalAlignment: HorizontalAlignment.Center
                    onTouch: 
                    {
                        if (event.isUp())
                        {
                            _app.invokeEmail("nemoryoliver@gmail.com", "Support : " + appname, "How may we help you?\n\n")
                        }
                    }
                }
                
                Label 
                {
                    text: "Twitter: @NemOry"
                    horizontalAlignment: HorizontalAlignment.Center
                    onTouch: 
                    {
                        if (event.isUp())
                        {
                            _app.invokeOpenWithTwitter("NemOry");
                        }
                    }
                }
                
                Label 
                {
                    text: "Facebook: NemOry Oliver Martinez"
                    horizontalAlignment: HorizontalAlignment.Center
                    onTouch: 
                    {
                        if (event.isUp())
                        {
                            _app.invokeOpenWithFacebook("100000187808439");
                        }
                    }
                }
                
                Label 
                {
                    text: "Website: http://nemoryoliver.com"
                    horizontalAlignment: HorizontalAlignment.Center
                    onTouch: 
                    {
                        if (event.isUp())
                        {
                            _app.invokeBrowser("http://nemoryoliver.com");
                        }
                    }
                }
            }
        }
    }
}