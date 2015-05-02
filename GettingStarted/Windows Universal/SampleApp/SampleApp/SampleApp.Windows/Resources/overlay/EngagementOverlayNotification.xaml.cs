/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 */

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using Windows.ApplicationModel.Core;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.ViewManagement;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

namespace Microsoft.Azure.Engagement.Overlay
{
  /// <summary>
  /// Engagement grid for overlay insertion of notification
  /// </summary>
  public sealed partial class EngagementOverlayNotification : Grid
  {
    private static EngagementOverlayNotification instance;
    private const short MAX_HEIGHT = 80;

    /// <summary>
    /// Singleton instance
    /// </summary>
    public static EngagementOverlayNotification Instance
    {
      get
      {
        if (instance == null)
        {
          instance = new EngagementOverlayNotification();
        }
        return instance;
      }
    }

    /// <summary>
    /// Use to create the overlay
    /// </summary>
    private EngagementOverlayNotification()
    {
      this.InitializeComponent();
    }

    /// <summary>
    /// Attach the SizeChanged handler
    /// </summary>
    public void SetHandler()
    {
      Window.Current.SizeChanged += DisplayProperties_OrientationChanged;
    }

    /// <summary>
    /// Detach the SizeChanged handler
    /// </summary>
    public void UnsetHandler()
    {
      Window.Current.SizeChanged -= DisplayProperties_OrientationChanged;
    }

    /// <summary>
    /// Set your webview elements to the correct size external use
    /// </summary>
    public void SetWebView()
    {
      double currentWidth;
#if WINDOWS_PHONE_APP
      /* Deal with the Windows Phone status bar */
      currentWidth = ApplicationView.GetForCurrentView().VisibleBounds.Width+1;
#else
      /* Windows store screen full width */
      currentWidth = Window.Current.Bounds.Width;
#endif
      this.engagement_notification_content.Width = currentWidth;
      this.engagement_notification_content.Height = MAX_HEIGHT;
    }

    /// <summary>
    /// Handler that takes the Windows.Current.SizeChanged and indicate that webview have to be resized
    /// </summary>
    /// <param name="sender">Event Originator</param>
    /// <param name="e">Window Size Changed Event argument</param>
    private void DisplayProperties_OrientationChanged(object sender, Windows.UI.Core.WindowSizeChangedEventArgs e)
    {
      SetWebView();
    }
  }
}
