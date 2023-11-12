require 'rails_helper'

RSpec.describe "Menus", type: :system do
  let!(:menu) { create(:menu) } 

  describe "GET menus#index" do
    context "一覧画面にアクセスしたとき" do
      before do
        visit menus_path
      end  
      
      it '表示リンクをクリックしたら詳細ページが正常に表示される' do
        click_link '表示'
        expect(page).to have_current_path(menu_path(menu))
        expect(page).to have_content(menu.name)
        expect(page).to have_content(menu.price)
      end
    
      it '編集リンクをクリックしたら編集ページが正常に表示される' do
        click_link '編集'
        expect(page).to have_current_path(edit_menu_path(menu))
        expect(page).to have_selector 'h1', text: 'メニューの編集'
      end
    
      it '削除リンクをクリックしたらメニューが正常に削除される' do
        accept_confirm do
          click_link '削除'
        end
        assert_no_text menu
      end

      it '新規作成リンクをクリックしたら新規作成ページが正常に表示される' do
        click_link '新規作成'
        expect(page).to have_current_path(new_menu_path)
        expect(page).to have_selector 'h1', text: 'メニュー新規作成'
      end
    end
  end

  describe "GET menus#new" do
    context "新規作成画面でメニューを作成したとき" do
      before do
        visit new_menu_path
      end  
      
      it '正常に作成されたメニューが表示される' do
        fill_in 'Name', with: 'new'
        fill_in 'Price', with: 888888
        click_button 'Create Menu'

        expect(page).to have_content('メニューを作成しました')

        new_menu = Menu.find_by(name: 'new')
        
        expect(page).to have_current_path(menu_path(new_menu))
        expect(page).to have_content('new')
        expect(page).to have_content(888888)
      end
    end
  end

  describe "GET menus#edit" do
    context "編集画面でメニューを更新したとき" do
      before do
        visit edit_menu_path(menu)
      end  
      
      it '正常に更新されたメニューが表示される' do
        fill_in 'Name', with: 'edit'
        fill_in 'Price', with: 777777
        click_button 'Update Menu'
        
        expect(page).to have_current_path(menu_path(menu))
        expect(page).to have_content('edit')
        expect(page).to have_content(777777)
      end
    end
  end
end
