import os
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager


class MultiBrowserWebDriver:

    def download_and_set_up_drivers(self):
        # Download and setup Chrome driver
        chrome_driver_path = ChromeDriverManager().install()
        print(f"Chrome driver installed at: {chrome_driver_path}")

        # Download and setup Firefox driver
        firefox_driver_path = GeckoDriverManager().install()
        print(f"Firefox driver installed at: {firefox_driver_path}")

        # Download and setup Edge driver
        edge_driver_path = EdgeChromiumDriverManager().install()
        print(f"Edge driver installed at: {edge_driver_path}")

        # For Windows, you might want to update the PATH variable in the system settings
        # Or use the following (but it's not a good practice for permanent changes)
        os.system(f'setx PATH "%PATH%;{os.path.dirname(chrome_driver_path)}"')
        os.system(f'setx PATH "%PATH%;{os.path.dirname(firefox_driver_path)}"')
        os.system(f'setx PATH "%PATH%;{os.path.dirname(edge_driver_path)}"')

    if __name__ == "__main__":
        download_and_set_up_drivers()
