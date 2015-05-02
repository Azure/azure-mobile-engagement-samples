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
  /// Engagement grid for overlay insertion of announcement
  /// </summary>
  public sealed partial class EngagementOverlayAnnouncement : Grid
  {
    private static EngagementOverlayAnnouncement instance;

    /// <summary>
    /// Singleton instance
    /// </summary>
    public static EngagementOverlayAnnouncement Instance
    {
      get
      {
        if (instance == null)
        {
          instance = new EngagementOverlayAnnouncement();
        }
        return instance;
      }
    }

    /// <summary>
    /// Use to create the overlay
    /// </summary>
    private EngagementOverlayAnnouncement()
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
      double currentHeight;
#if WINDOWS_PHONE_APP
      /* Deal with the Windows Phone status bar */
      currentWidth = ApplicationView.GetForCurrentView().VisibleBounds.Width + 1;
      currentHeight = ApplicationView.GetForCurrentView().VisibleBounds.Height + 1;
#else
      /* Windows store screen full width and height */
      currentWidth = Window.Current.Bounds.Width;
      currentHeight = Window.Current.Bounds.Height;
#endif
      this.engagement_announcement_content.Width = currentWidth;
      this.engagement_announcement_content.Height = currentHeight;
    }

    /// <summary>
    /// Handler that takes the Windows.Current.SizeChanged, it indicates that webview have to be resized
    /// </summary>
    /// <param name="sender">Event originator</param>
    /// <param name="e">Window Size Changed Event argument</param>
    private void DisplayProperties_OrientationChanged(object sender, Windows.UI.Core.WindowSizeChangedEventArgs e)
    {
      SetWebView();
    }
  }
}
