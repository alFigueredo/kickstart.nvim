return {
  'aklt/plantuml-syntax',
  config = function()
    -- PlantUML Renderer Command
    local function render_plantuml()
      local file = vim.fn.expand '%:p'
      local cmd = ('plantuml "' .. file .. '"')

      vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        on_stdout = function(_, data)
          if data then
            vim.notify(table.concat(data, '\n'))
          end
        end,
        on_stderr = function(_, data)
          if data then
            vim.notify(table.concat(data, '\n'), vim.log.levels.ERROR)
          end
        end,
        on_exit = function(_, code)
          if code == 0 then
            vim.notify '✔ Diagrama generado'
            -- Abrir el .png si querés
            local png = file:gsub('%.puml$', '.png')
            vim.fn.jobstart({ 'xdg-open', png }, { detach = true })
          else
            vim.notify('❌ Falló la compilación', vim.log.levels.ERROR)
          end
        end,
      })
    end

    -- Define el comando :RenderUML
    vim.api.nvim_create_user_command('RenderUML', render_plantuml, {})

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'plantuml',
      callback = function()
        vim.keymap.set('n', '<leader>pr', render_plantuml, { desc = 'Render PlantUML' })

        vim.api.nvim_create_autocmd('BufWritePost', {
          buffer = 0,
          callback = function()
            local file = vim.fn.expand '%:p'
            local output = file:gsub('%.puml$', '.png')
            local cmd = { 'plantuml', file }

            vim.fn.jobstart(cmd, {
              on_exit = function(_, code)
                if code == 0 then
                  vim.notify('✔ UML generado: ' .. output, vim.log.levels.INFO, { title = 'PlantUML' })
                else
                  vim.notify('❌ Error al compilar PlantUML', vim.log.levels.ERROR, { title = 'PlantUML' })
                end
              end,
            })
          end,
        })
      end,
    })
  end,
}
